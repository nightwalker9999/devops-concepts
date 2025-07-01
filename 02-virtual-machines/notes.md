# Detailed Notes & Q&A: Virtual Machines

## 1. VM Definition & Analogy

- A **Virtual Machine** is a logical computer instance with dedicated virtual CPU, memory, and storage—isolated yet sharing the host.
- **One-acre analogy:** One family on a whole acre vs. multiple families on subdivided parcels optimizes land (hardware) use.

## 2. Hypervisor Types

- **Type-1 (Bare-metal):** Installs directly on physical hardware for higher performance (e.g., ESXi, Hyper-V).  
- **Type-2 (Hosted):** Runs as an application on a host OS for convenience (e.g., VirtualBox).

## 3. Cloud VM Lifecycle

1. **Launch:** User specifies instance type and region.  
2. **Allocation:** Cloud control plane picks a host with sufficient free resources.  
3. **Creation:** Hypervisor allocates vCPU/vRAM/vDisk, attaches networking.  
4. **Access:** User receives IP & key-pair to SSH or RDP into the VM.

## 4. DevOps Use Cases

- **Environment Sandboxes:** Isolated testing for each feature branch.  
- **CI Runners:** Dedicated build agents that can be spun down after job completion.  
- **Legacy Support:** Run OS or software not container-friendly.

---

## Refined Q&A

**Q1: What is a VM, and how does the one-acre analogy apply?**  
A VM is a self-contained logical computer with its own virtualized hardware. Subdividing a one-acre plot into multiple rentable parcels mirrors partitioning a physical server into multiple VMs, each fully functional yet resource-efficient.

**Q2: Differentiate Type-1 vs. Type-2 hypervisors.**  
A Type-1 hypervisor runs directly on the host’s hardware for maximum performance (bare-metal), whereas a Type-2 hypervisor runs on a host operating system for ease of use and flexibility.

**Q3: Outline AWS EC2 provisioning steps.**  
When you launch an EC2 instance, AWS matches your requested specs to an underutilized physical host, instructs that host’s hypervisor to spin up your VM, and then provides you the IP address and SSH key to access it.

**Q4: When choose VM over container?**  
Use a VM when you need a fully isolated OS environment—such as running legacy software, requiring kernel-level isolation, or hosting multiple containerized services on a single sandbox.