#!/bin/bash
#############################################################################
##
##  file   : bind-create-zone.sh
##  author : richard klein leugemors
##  remark : simple bash script to automagically create dns zone files
##
#############################################################################

# initializations
# ---------------
ZONE=$1
SERIAL=`date +%Y%m%d01`
LINE1=";############################################################################"
LINE2=";##"
LINE3=";----------------------------------------------------------------------------"
LINE4=";### EOF ####################################################################"

# functions
# ---------
function header
{
	echo ""
	echo $LINE3
	echo "; $1"
	echo $LINE3
	echo ""
}

# create header
# -------------
echo $LINE1
echo $LINE2
echo ";##  file   : db.$ZONE.zone"
echo ";##  author : richard klein leugemors"
echo ";##  remark : automatically generated zone file"
echo $LINE2
echo $LINE1

# write time to live
# ------------------
echo -e "\n\$TTL\t\t   14400       ; default time to live"

# write start of authority
# ------------------------
header "start of authority"
echo -e "$ZONE.\tIN SOA ns.uzori.com. hostmaster.uzori.com. ("
echo -e "\t\t   ${SERIAL}  ; serial number"
echo -e "\t\t   14400       ; refresh after 4 hours"
echo -e "\t\t   3600        ; retry after 1 hour"
echo -e "\t\t   604800      ; expire after 7 days"
echo -e "\t\t   14400 )     ; negative caching ttl of 4 hours"

# write sender policy framework
# -----------------------------
header "sender policy framework"
echo -e "$ZONE.\tIN TXT\t\"v=spf1 a mx ip4:83.160.79.1 mx:mail.uzori.com +all\""

# write dns servers
# -----------------
header "dns servers"
echo -e "$ZONE.\tIN NS\tns.uzori.com."
echo -e "$ZONE.\tIN NS\tns2.uzori.com."

# write mail servers
# ------------------
header "mail servers"
echo -e "$ZONE.\tIN MX\t10 mail.uzori.com."
#echo -e "$ZONE.\tIN MX\t20 mail2.uzori.com."

# write local host
# ----------------
header "local host"
echo -e "localhost\tIN A\t127.0.0.1\n"
#echo -e "localhost\tIN AAAA\t::1"

# write list of hosts
# -------------------
header "list of hosts"
echo -e "$ZONE.\tIN A\t95.211.40.59\n"
#echo -e "$ZONE.\tIN AAAA\tfe80::250:56ff:fe00:62f"

# write list of web/ftp servers
# -----------------------------
header "list of web/ftp servers"
echo -e "www.$ZONE.\tIN A\t\t95.211.40.59\n"
#echo -e "www.$ZONE.\tIN AAAA\t\tfe80::250:56ff:fe00:62f\n"
echo -e "ftp.$ZONE.\tIN CNAME\twww.$ZONE."

# we're done
# ----------
echo -e "\n$LINE4"

### EOF #####################################################################
