# Docker Container Monitoring Script

Create file `/etc/sudoers.d/docker`
```
icinga ALL=(ALL) NOPASSWD: /usr/sbin/docker container ls 
```
Change permission `chmod 400 /etc/sudoers.d/docker`
