#!/bin/bash

##############################################################################
# QuickScan version definition
#
# YYYY-MM-DD  WHO  DESCRIPTION
#
# 2000-10-18  WVD  Ipchain,free and route headers fixed. Upgrade to 5.1
# 2000-10-23  WVD  RPM en PACKEG list included in scans. Upgrade to 5.2
# 2000-10-25  WVD  IPCHAIN command updated. Upgrade to 5.3
# 2000-10-31  WVD  ENDDATE added. Upgrade to 5.4
# 2000-11-02  WVD  Touch added. Upgrade to 5.5
# 2000-11-14  WVD  DPKG fixed. Upgrade to 5.6
# 2000-12-11  WVD  Homes fixed. Upgraded to 5.7


QSVERSION="5.7"


#############################################################################
# Get programs

CAT=`which cat`
DATE=`which date`
DF=`which df`
DNSDOMAINNAME=`which dnsdomainname`
DOMAINNAME=`which domainname`
DPKG=`which dpkg`
EGREP=`which egrep`
FIND=`which find`
FREE=`which free`
GREP=`which grep`
HOSTNAME=`which hostname`
IFCONFIG=`which ifconfig`
IPCHAINS=`which ipchains`
LS=`which ls`
LSMOD=`which lsmod`
PS=`which ps`
ROUTE=`which route`
RPM=`which rpm`
SUM=`which sum`
UNAME=`which uname`
UPTIME=`which uptime`
UVSCAN=`which uvscan`
TOUCH=`which touch`
MKDIR=`which mkdir`
DMESG=`which dmesg`
DU=`which du`

#############################################################################
# QuickScan version & date information

echo "[startdate]"
if [ -n $DATE ]; then
	$DATE
else
	echo "No date"
fi
echo "[/startdate]"

echo "[version]"
echo $QSVERSION
echo "[/version]"

##########################################################################
# System usage: uptime, free, df

echo "[uptime]"

if [ -n $UPTIME ]; then
	$UPTIME
else
	echo "No uptime"
fi

echo "[/uptime]"

echo "[free]"

if [ -n $FREE ]; then
	$FREE -o -b
else
	echo "No free"
fi

echo "[/free]"

echo "[df]"

if [ -n $DF ]; then
	$DF -T
else
	echo "No df"
fi

echo "[/df]"


##############################################################################
# Get distro/vendor information

echo "[distro]"

if [   -f /etc/*release* ]; then
          $CAT /etc/*release*;

elif [ -d /var/lib/LST ]; then
          $RPM -q -a | $EGREP Open\|COL;
          $CAT /var/lib/LST/BASEVERSION;
          $CAT /etc/.issue;

elif [ -f /etc/issue.net ]; then
	  $LS /etc/issue.net;
	  $CAT /etc/issue.net;

elif [ -f /etc/*version* ]; then
  	  $LS /etc/*version*;
          $CAT /etc/*version*;

elif [ -d /usr/lib/setup ]; then
          $LS /usr/lib/setup | $GREP version;

else
        echo "Unknown distribution";
fi

echo "[/distro]"

#############################################################################
# File integrity check

echo "[filecheck]"

# TODO

#if [ -n $RPM ]; then
#	$RPM -V -a;
#else 
	echo "use tripwire or AIDE"
#fi

echo "[/filecheck]"

############################################################################
# Process Lijst

echo "[psax]"
if [ -n $PS ]; then
	$PS -ax
else
	echo "No ps"
fi
echo "[/psax]"

###########################################################################
# General system information

echo "[hostname]"
if [ -n $HOSTNAME ]; then
	$HOSTNAME
else
	echo "No hostname"
fi
echo "[/hostname]"

echo "[domainname]"
if [ -n $DOMAINNAME ]; then
	$DOMAINNAME
else
	echo "No domainname"
fi
echo "[/domainname]"

echo "[dnsdomainname]"
if [ -n $DNSDOMAINNAME ]; then
	$DNSDOMAINNAME
else
	echo "No dnsdomainname"
fi
echo "[/dnsdomainname]"

echo "[uname]"
if [ -n $UNAME ]; then
	$UNAME -a
else
	echo "No uname"
fi
echo "[/uname]"

###########################################################################
# Setuid section

echo "[setuid]"
if [ -n $FIND ]; then
	$FIND / -perm +4000
else
	echo "No find"
fi
echo "[/setuid]"

###########################################################################
# Create a kernel sum and module check

echo "[kernelsum]"
if [ -f /etc/lilo.conf ]; then
	KERNIMG=`cat /etc/lilo.conf | grep image | head -1 | cut -d "=" -f 2`;
else
	echo "No /etc/lilo.conf"
fi

if [ -n $KERNIMG ]; then
	$SUM $KERNIMG;
else
	echo "No kernelimage found";
fi

echo "[/kernelsum]";

echo "[lsmod]"
if [ -n $LSMOD ]; then
	$LSMOD
else
	echo "No lsmod"
fi
echo "[/lsmod]"

##############################################################################
# Network: ifconfig and route

echo "[ifconfig]"
if [ -n $IFCONFIG ]; then
	$IFCONFIG
else
	echo "No ifconfig"
fi
echo "[/ifconfig]"

echo "[route]"
if [ -n $ROUTE ]; then
	$ROUTE -n
else
	echo "No route"
fi
echo "[/route]"

###########################################################################
# Ipchains

echo "[ipchains]"

if [ -n $IPCHAINS ]; then
	$IPCHAINS -L -n -v;
else
	echo "No ipchains";
fi

echo "[/ipchains]"

############################################################################
# Virus check
echo "[uvscan]"

if [ -n $UVSCAN ]; then
	$UVSCAN --version;
else
	echo "No virus checker"
fi

echo "[/uvscan]"


############################################################################
# System usage per user: du /home, ls /var/spool/mail

echo "[homes]"
if [ -n $DU ]; then
	cd /home
	$DU --max-depth=1
else
	echo "No du"
fi
echo "[/homes]"

echo "[mail]"
if [ -n $LS ]; then
	$LS -latur /var/spool/mail
else
	echo "No ls"
fi
echo "[/mail]"

##########################################################################
# Sendmail functioneren: ls /var/spool/mqueue

echo "[mqueue]"
if [ -n $LS ]; then
	$LS -latur /var/spool/mqueue
else
	echo "No ls"
fi
echo "[/mqueue]"

#########################################################################
# Log files

echo "[logdir]"
if [ -n $LS ]; then
	$LS -latur /var/log
else
	echo "No ls"
fi
echo "[/logdir]"

#########################################################################
# Fast TripWire

echo "[tripwire]"
if [ -d /usr/local/etc ]; then
	if [ -f /usr/local/etc/.quickscan ]; then
		if [ -n $FIND ]; then
			$FIND / -cnewer /usr/local/etc/.quickscan | grep -v "/proc" | grep -v "/var" | grep -v "/home"
		else
			echo "No tripwire"
		fi
	else
		$MKDIR /usr/local/etc
		$TOUCH /usr/local/etc/.quickscan
	fi
else
	$MKDIR -p /usr/local/etc
	$TOUCH /usr/local/etc/.quickscan
fi
echo "[/tripwire]"




#########################################################################
# RPM

echo "[rpmlist]"
if [ -n $RPM ]; then
	$RPM -q -a --queryformat "%{DISTRIBUTION}=%{RELEASE}=%{NAME}=%{VERSION}\n"
else
	echo "No RPM"
fi
echo "[/rpmlist]"

############################################################################
# DPKG

echo "[dpkglist]"
if [ -n $DPKG ]; then
	$DPKG -l
else
	echo "No DPKG"
fi
echo "[/dpkglist]"


##########################################################################
# INTERUPTS

echo "[interrupts]"
if [ -f /proc/interrupts ]; then
	$CAT /proc/interrupts
else
	echo "no /proc/interrupts"
fi
echo "[/interrupts]"

####################################
# IO PORTS

echo "[ioports]"
if [ -f /proc/ioports ]; then
	$CAT /proc/ioports
else
	echo "no /proc/ioports"
fi
echo "[/ioports]"


######################################
# CPU INFO

echo "[cpuinfo]"
if [ -f /proc/cpuinfo ]; then
	$CAT /proc/cpuinfo
else
	echo "no /proc/cpuinfo"
fi
echo "[/cpuinfo]"


####################################
# PCI

echo "[pci]"
if [ -f /proc/pci ]; then
	$CAT /proc/pci
else
	echo "no /proc/pci"
fi
echo "[/pci]"


####################################
# INETCONF

echo "[inetdconf]"
if [ -f /etc/inetd.conf ]; then
	$CAT /etc/inetd.conf
else
	echo "no /etc/inetd.conf"
fi
echo "[/inetdconf]"


####################################
# SECURE TTY

echo "[securetty]"
if [ -f /etc/securetty ];then
	$CAT /etc/securetty
else
	echo "no /etc/securetty"
fi
echo "[/securetty]"



##################################
# EXPORTS

echo "[exports]"
if [ -f /etc/exports ]; then
	$CAT /etc/exports
else
	echo "no /etc/exports"
fi
echo "[/exports]"


#############################
# HOSTALLOW

echo "[hostallow]"
if [ -f /etc/hosts.allow ]; then
	$CAT /etc/hosts.allow
else
	echo "no /etc/hosts.allow"
fi
echo "[/hostallow]"


###############################
# DMESG

echo "[dmesg]"
if [ -n $DMESG ]; then
	$DMESG
else
	echo "no dmesg"
fi
echo "[/dmesg]"



########################################################################
# END DATE
echo "[enddate]"
if [ -n $DATE ]; then
	$DATE
else
	echo "No date"
fi
echo "[/enddate]"


########################################################################
# TOUCH
echo "[touch]"
if [ -n $TOUCH ]; then
	$TOUCH /usr/local/etc/.quickscan
else
	echo "No touch"
fi
echo "[/touch]"
