#!/bin/bash

# get public ip address from checkip.dyndns.org
public_ip=`wget -q -O - checkip.dyndns.org | \
sed -e 's/.*Current IP Address: //' -e 's/<.*$//'`

echo $public_ip

# get physical address from ip address from melissadata.com
wget -q -O - \
http://www.melissadata.com/Lookups/iplocation.asp?ipaddress=$public_ip | \
grep "\(\(City\)\|\(State or Region\)\|\(Country\)\)<\/td>" | \
sed "s/.*<b>\([^<]*\)<\/b>.*/\1/"
