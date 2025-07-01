# 02. Virtual Machines

> **Video:**  
> https://www.youtube.com/watch?v=lgUwYwBozow&list=PLdpzxOOAlwvIKMhk8WhzN1pYoJ1YU8Csa&index=4

---

## Overview

A Virtual Machine (VM) is a fully isolated logical computer instance, complete with its own vCPU, vRAM, vDisk, and virtual hardware—all running on a shared physical host. Virtualization maximizes resource utilization by partitioning one server into multiple VMs.

---

## Key Concepts

1. **Analogy (Efficiency):**  
   Subdividing a one-acre plot into rentable parcels optimizes land use—just like slicing one server into many VMs.

2. **Hypervisor:**  
   - **Type-1 (Bare-metal):** Runs directly on hardware (e.g., VMware ESXi, Hyper-V).  
   - **Type-2 (Hosted):** Runs on top of an OS (e.g., VirtualBox, VMware Workstation).

3. **VM Provisioning Workflow:**  
   1. Request a VM (e.g., AWS EC2) with specific specs in a chosen region.  
   2. Cloud provider selects an underutilized physical host.  
   3. Host’s hypervisor creates the VM and assigns networking (IP, SSH key).  
   4. You connect—hardware details remain abstracted.

4. **DevOps Benefits:**  
   - Isolation for dev/test/staging environments.  
   - On-demand scalability.  
   - Legacy or specialized OS support.

---

## How to Work Through This Module

1. Read this **README.md** for the big picture.  
2. Open **notes.md** for detailed explanations and refined Q&A.  
3. Complete the mini-lab in **exercise/**.  
4. Test yourself with the drills in **interview.md**.