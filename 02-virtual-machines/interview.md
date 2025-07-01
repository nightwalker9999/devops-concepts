# Interview Drill: Virtual Machines

1. **Question:** Explain what a hypervisor does and why it’s critical for virtualization.  
   **Answer:** A hypervisor sits between hardware and VMs, allocating CPU, memory, and I/O to each VM, ensuring isolation and multiplexing on a single host.

2. **Question:** When would you prefer a VM instead of a Docker container in your infrastructure?  
   **Answer:** When needing full OS isolation, kernel-level features, or hosting legacy applications not compatible with container runtimes.