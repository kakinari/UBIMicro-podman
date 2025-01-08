pwd
ls
cd /root
ls
dnf install oracle-database-preinstall-23ai-1.0-2.el9.x86_64.rpm 
dnf install -f oracle-database-free-23ai-1.0-1.el9.x86_64.rpm 
dnf install -y oracle-database-free-23ai-1.0-1.el9.x86_64.rpm 
systemctl list-unit-files
/etc/init.d/oracle-free-23ai configure
hostname
dnf search hostname
exit
