#!/bin/env sh

echo "-- I - Time Setting --"

echo "\tTime : format 'hh:MM' :"
read input_time
timedatectl set-time $input_time

echo "-- II - Disk partitioning --"

echo "\tSelect a partitioning utility :\t\n1 - fdisk\n\t2 - cfdisk\n\t3 - parted"

echo "-- II - --"
