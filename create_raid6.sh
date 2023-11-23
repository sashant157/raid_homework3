#!/bin/bash
echo "Hello, this scrypt is build RAID6 with /dev/sd{b,c,d,e,f}"
while true; do

read -p "Do you want to proceed? (y/n) " yn

case $yn in 
	y ) sudo mdadm --zero-superblock --force /dev/sd{b,c,d,e,f}
	    sudo mdadm --create --verbose /dev/md0 -l 6 -n 5 /dev/sd{b,c,d,e,f};
		break;;
	n ) echo exiting...;
		exit;;
	* ) echo invalid response;;
esac

done
