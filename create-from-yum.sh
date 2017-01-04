#!/bin/bash
## create-from-yum.sh
##
## @author gm42
##
## copy ec2-net-utils package contents into release/ subdirectory
##
#

set -e

if [ ! $UID -eq 0 ]; then
        echo "ERROR: needs to be run as root" 1>&2
        exit 1
fi

tar cf ec2-net-utils.tar $(repoquery -l ec2-net-utils)

rm -rf release/
mkdir release

cd release
tar xf ../ec2-net-utils.tar
rm ../ec2-net-utils.tar
