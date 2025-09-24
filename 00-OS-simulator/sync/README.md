## The OS / concurrency concepts you’re observing

* Race condition: Output depends on timing/interleaving; same code, different (wrong) results.

* Critical section: The increment region (read–modify–write) on counter that must be protected.

* Mutual exclusion: Guarantee only one thread is in that critical section at a time (prevents overwrites).

* Atomicity: “All-or-nothing” operation; your increment is not atomic when split into steps.

* Preemption / time-slicing: The scheduler switches threads at “inconvenient” points (your sleep(0) encourages that).

* (Related conditions you learned) Progress & Bounded waiting matter for algorithm fairness; here we’re focusing on safety (correctness) via mutual exclusion.

### sync/01_race_no_lock.py — *Forced lost-update race (no mutual exclusion)*

#### Key concepts inline:

* *Critical section:* the tmp = counter; ...; counter = tmp + 1 region.

* *Preemption/time-slicing:* time.sleep(0) yields control to other threads.

* *Atomicity:* we broke a logical “increment” into non-atomic steps.

* *Race condition:* interleavings cause lost updates → Actual << Expected.

### sync/02_mutex_lock.py — *Mutual exclusion (correctness restored)*

#### Key concepts inline:

* *Mutual exclusion (safety):* with lock: ensures only one thread in the critical section.

* *Progress/bounded waiting:* Not explicitly shown here, but the simple mutex typically provides progress (if no one is inside, someone can enter) and practical bounded waiting (implementation-dependent).

* *Preemption harmlessness:* Even if the thread yields inside the with lock block, others can’t enter, so no lost updates.

