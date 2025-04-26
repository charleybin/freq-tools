## echo VMware 磁盘扩容后，ubuntu如何利用起来。

#####查看磁盘状态
# lsblk 
NAME                      MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sda                         8:0    0  100G  0 disk 
├─sda1                      8:1    0    1M  0 part 
├─sda2                      8:2    0    2G  0 part /boot
└─sda3                      8:3    0   98G  0 part 
  └─ubuntu--vg-ubuntu--lv 253:0    0   38G  0 lvm  /
sr0                        11:0    1    2G  0 rom  

#df -h
Filesystem                         Size  Used Avail Use% Mounted on
tmpfs                              791M  1.2M  790M   1% /run
/dev/mapper/ubuntu--vg-ubuntu--lv   38G   27G  9.1G  75% /
tmpfs                              3.9G     0  3.9G   0% /dev/shm
tmpfs                              5.0M     0  5.0M   0% /run/lock
/dev/sda2                          2.0G  126M  1.7G   7% /boot
tmpfs                              791M  4.0K  791M   1% /run/user/1000

####### 前提：使用root 用户登录
#sudo su
apt install parted

##步骤 1：调整分区表（扩展sda3分区）

parted /dev/sda resizepart 3 100%

partprobe /dev/sda 

##步骤 2：扩展物理卷(PV)

pvresize /dev/sda3 

##步骤 3：扩展逻辑卷(LV)

lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv 

##步骤 4：扩展文件系统
# 如果是 ext4/ext3/ext2：
resize2fs /dev/ubuntu-vg/ubuntu-lv
# 如果是 xfs：
sudo xfs_growfs /

#####查看结果
# lsblk
NAME                      MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sda                         8:0    0  100G  0 disk 
├─sda1                      8:1    0    1M  0 part 
├─sda2                      8:2    0    2G  0 part /boot
└─sda3                      8:3    0   98G  0 part 
  └─ubuntu--vg-ubuntu--lv 253:0    0   98G  0 lvm  /
sr0                        11:0    1    2G  0 rom  

#df -h
Filesystem                         Size  Used Avail Use% Mounted on
tmpfs                              791M  1.2M  790M   1% /run
/dev/mapper/ubuntu--vg-ubuntu--lv   97G   27G   66G  29% /
tmpfs                              3.9G     0  3.9G   0% /dev/shm
tmpfs                              5.0M     0  5.0M   0% /run/lock
/dev/sda2                          2.0G  126M  1.7G   7% /boot
tmpfs                              791M  4.0K  791M   1% /run/user/1000


