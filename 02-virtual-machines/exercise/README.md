# Exercise: Spin Up Your First VM

**Objective:** Practice creating a VM in your chosen environment.

## Steps

1. **Local VM (Optional):**  
   - Install VirtualBox or VMware Workstation.  
   - Create a new VM (Linux distro) with 1 vCPU and 2 GB RAM.  
   - Boot and SSH into it.

2. **Cloud VM:**  
   - Log into AWS Console (or Azure/GCP).  
   - Launch an EC2 instance with 1 vCPU, 2 GB RAM in your preferred region.  
   - Select a key pair, security group allowing SSH (port 22).  
   - SSH into the public IP.

3. **Validate:**  
   - Run `lscpu` and `free -m` on the VM to confirm specs.  
   - Install `nginx` (or `httpd`) and verify you can access its default page.

**Deliverables:**
- `local-vm.md` (commands & outcome)  
- `cloud-vm.md` (console steps & connectivity test)  
- A screenshot or command output showing the web server response.