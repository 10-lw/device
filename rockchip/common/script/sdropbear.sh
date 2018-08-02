#!/system/bin/sh
log -t PackageManager "Start deopbear======"
mount -o remount,rw /system
mkdir /system/etc/dropbear
mkdir /system/etc/dropbear/.ssh
chmod 755 /system/etc/dropbear
chmod 755 /system/etc/dropbear/.ssh
chmod 755 /system/xbin/dropbear*
cp /system/bin/authorized_keys /system/etc/dropbear/.ssh/authorized_keys
if [ -f /system/etc/dropbear/dropbear_dss_host_key ]; then
   echo "dss 文件存在!"
else
   echo "dss 文件不存在!"
   dropbearkey -t dss -f /system/etc/dropbear/dropbear_dss_host_key
fi

if [ -f /system/etc/dropbear/dropbear_rsa_host_key ]; then
   echo "rsa 文件存在!"
else
   echo "rsa 文件不存在!"
   dropbearkey -t rsa -f /system/etc/dropbear/dropbear_rsa_host_key
fi

dropbear -v
mount -o remount,ro /system
