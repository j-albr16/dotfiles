#!/bin/bash


echo Removing /var/lib/rook

sudo rm -rf /var/lib/rook -rf


sleep 2


DISK=$1

if [[  -z $DISK ]]; then
    echo No Disk was Provided Assuming it is /dev/sda4
    DISK="/dev/sda4"
fi

echo Sapping Disk

sudo sgdisk --zap-all $DISK

sleep 3

echo Clean SSD
sudo blkdiscard $DISK

echo Removing Ceph Clutter
ls /dev/mapper/ceph-* | xargs -I% -- dmsetup remove %
rm -rf /dev/ceph-*
rm -rf /dev/mapper/ceph--*

echo Info Os about Partition Change
sudo partprobe $DISK
