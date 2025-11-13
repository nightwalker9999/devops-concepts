
## **Ansible – Hands-On Learning Log (Cloud Shell Lab)**

**Date:** *13 Nov 2025*
**Environment:** Google Cloud Shell (Ubuntu, ephemeral VM)

---

### ✅ **1. Inventory Setup**

Created a simple `inventory` file:

```
[local]
localhost ansible_connection=local
```

Verified inventory works with:

```bash
ansible -i inventory all -m shell -a "nproc"
ansible -i inventory all -m shell -a "df -h"
```

Output confirmed Ansible can target localhost successfully.

---

### ✅ **2. Ad-Hoc Commands Executed**

Ran basic Ansible modules:

```bash
ansible -i inventory all -m shell -a "touch /tmp/ansible_from_cloudshell"
ansible -i inventory all -m shell -a "ls -l /tmp | grep ansible"
```

Purpose:
✔ Understand module execution
✔ Verify changes
✔ Practice idempotency concepts

---

### ✅ **3. Playbook Executed (apt + service modules)**

Created `nginx-playbook.yml`:

```
---
- name: Install and start nginx on local
  hosts: all
  become: true

  tasks:
    - name: Install nginx
      apt:
        name: nginx
        state: present
        update_cache: true

    - name: Start nginx
      service:
        name: nginx
        state: started
```

Executed:

```bash
ansible-playbook -i inventory nginx-playbook.yml -vvv
```

**Result:**

* `apt` installation worked
* `service: started` failed due to **Cloud Shell restrictions**

  * Cloud Shell blocks systemd services from starting
  * NOT a playbook error — environment limitation

This is expected behaviour.

---

### ✅ **4. Debugging Learned**

* Fixing YAML indentation problems
* Understanding “conflicting action statements”
* Understanding module parameter structure
* Reading verbose (`-vvv`) logs
* Identifying environment vs Ansible issues
* Why Cloud Shell can't run systemd services

---

### 📝 **5. Summary of Skills Gained**

* Inventory creation & management
* Ad-hoc modules (`shell`, `command`)
* Writing basic playbooks
* Using `become: true`
* Package management (`apt`)
* Service management basics
* Troubleshooting failures (YAML + system level)
* Understanding ephemeral environment limitations

---

### 🎯 **6. What’s Next**

Move to **Terraform** → create first resource → variables → outputs → modules.
Ansible basics are complete for now.



