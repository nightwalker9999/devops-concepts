import threading, time, sys

# N = how many increments each thread attempts
# T = how many threads run concurrently
N = 50_000
T = 8

counter = 0  # shared state (critical resource)

# Encourage very frequent thread switches so the race manifests
try:
    # Shorter switch interval -> interpreter is willing to switch threads more often
    sys.setswitchinterval(1e-6)
except Exception:
    pass

def task():
    """
    Each thread tries to increment the global counter N times.
    We DELIBERATELY split 'counter += 1' into 3 steps to widen the race window:
      1) read  -> tmp = counter
      2) yield -> time.sleep(0) (gives scheduler a chance to run other threads)
      3) write -> counter = tmp + 1
    Without a lock, two threads can read the same old value and later overwrite each other.
    """
    global counter
    for i in range(N):
        tmp = counter       # READ (not atomic)
        time.sleep(0)       # YIELD (preemption/time-slicing; another thread runs here)
        counter = tmp + 1   # WRITE (lost update if someone else already wrote)

        # Tip: If you ever get exact results repeatedly, increase T or N to amplify interleavings.

if __name__ == "__main__":
    # Create and start T threads running the same critical-section code WITHOUT protection
    threads = [threading.Thread(target=task) for _ in range(T)]
    for t in threads:
        t.start()

    # Wait for all threads to finish (join ensures we measure final counter)
    for t in threads:
        t.join()

    expected = N * T  # What we'd get if every increment were atomic/safely serialized
    print("Expected:", expected, "Actual:", counter)

    # If Actual < Expected, increments were lost due to race conditions
    if counter != expected:
        print("→ Race occurred (lost increments).  [No mutual exclusion]")
    else:
        print("→ Got lucky this run; try again or raise T/N.  [Race is nondeterministic]")