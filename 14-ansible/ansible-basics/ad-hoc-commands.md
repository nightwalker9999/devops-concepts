# Ad-Hoc Commands (Executed)

1. touch a file
   ansible -i inventory all -m shell -a "touch /tmp/ansible_from_cloudshell"

2. CPU count
   ansible -i inventory all -m shell -a "nproc"

3. Disk usage
   ansible -i inventory all -m shell -a "df -h"

4. File verification
   ls -l /tmp | grep ansible

