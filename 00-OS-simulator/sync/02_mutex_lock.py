import threading, time, sys

N = 50_000
T = 8

counter = 0  # same shared resource
lock = threading.Lock()  # mutex to enforce mutual exclusion

try:
    sys.setswitchinterval(1e-6)  # still encourage frequent switches
except Exception:
    pass

def task():
    """
    Same logical work as the race demo, BUT the critical section is protected by a lock.
    Even if the scheduler preempts between iterations, only ONE thread may enter the
    read→modify→write region at a time, preserving correctness.
    """
    global counter
    for i in range(N):
        with lock:          # ENTER critical section (mutual exclusion)
            tmp = counter   # READ
            time.sleep(0)   # Even with a yield here, other threads cannot enter the 'with' block
            counter = tmp + 1  # WRITE
        # EXIT critical section automatically when 'with' scope ends

if __name__ == "__main__":
    # Launch threads as before
    threads = [threading.Thread(target=task) for _ in range(T)]
    for t in threads:
        t.start()
    for t in threads:
        t.join()

    expected = N * T
    print("Expected:", expected, "Actual:", counter)

    # With mutual exclusion, Actual should always equal Expected
    if counter == expected:
        print("→ Correct: mutual exclusion prevents lost updates.  [Safety satisfied]")
    else:
        print("→ Unexpected mismatch: investigate lock usage or environment.")