#!/bin/sh

if [ `whoami` != "zimbra" ]; then
echo "Must be executed as the zimbra user."
exit 1
fi 
zmcontrol -v

echo "Number of users"
echo "---------------"
zmprov gaa | wc -l

echo

echo "Processor Version"
echo "-----------------"
PROC_VER=`cat /proc/version`
echo "$PROC_VER"

echo

echo "Processor Info"
echo "--------------"
PROC_INFO=`cat /proc/cpuinfo`
echo "$PROC_INFO"

echo "Mem Info"
echo "--------"
FREE=`free -m`
echo "$FREE"
echo "`dmesg | grep Mem`"

echo

echo "FSTAB File"
echo "----------"
echo "`cat /etc/fstab`"

echo

echo "Mtab file"
echo "---------"
echo "`cat /etc/mtab`"

echo 

echo "Disk Space"
echo "----------"
echo "`df -h`"

echo

echo "Threads"
echo "-------"
zmprov gacf | grep -i threads
echo
echo "Message Cache Size"
echo "------------------"
zmprov gacf | grep zimbraMessageCacheSize
echo
echo "Info from zmlocalconfig"
echo "-----------------------"
zmlocalconfig -d | grep java_options
zmlocalconfig -n | grep maxActive
zmlocalconfig | grep max_uncommitted_operations
zmlocalconfig | grep percent
echo

echo "Mysql Info"
echo "----------"
grep max_connections /opt/zimbra/conf/my.cnf
grep innodb_buffer_pool_size  /opt/zimbra/conf/my.cnf
grep innodb_max_dirty_pages_pct  /opt/zimbra/conf/my.cnf
grep innodb_flush_method  /opt/zimbra/conf/my.cnf

echo

echo "Java Process"
echo "------------"
ps -ef | grep java

echo

echo "LDAP Info"
echo "---------"
/opt/zimbra/sleepycat/bin/db_stat -m -h /opt/zimbra/openldap-data | head -n 11

echo

/opt/zimbra/sleepycat/bin/db_stat -m -h /opt/zimbra/openldap-data | head -n 12
