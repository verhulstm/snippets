# Install snapd
yum -y install yum-plugin-copr epel-release
yum -y copr enable ngompa/snapcore-el7
yum -y install snapd
systemctl enable --now snapd.socket

# Install ZFS (skip if you don't want it)
yum -y install http://download.zfsonlinux.org/epel/zfs-release.el7_4.noarch.rpm
yum-config-manager --disable zfs
yum-config-manager --enable zfs-kmod
yum -y install zfs

# Configure the kernel
grubby --args="user_namespace.enable=1" --update-kernel="$(grubby --default-kernel)"
grubby --args="namespace.unpriv_enable=1" --update-kernel="$(grubby --default-kernel)"
echo "user.max_user_namespaces=3883" > /etc/sysctl.d/99-userns.conf

# reboot

# Install the LXD snap
snap install lxd

# Configure LXD
lxd init

# Launch containers
lxc launch ubuntu:16.04 c1
