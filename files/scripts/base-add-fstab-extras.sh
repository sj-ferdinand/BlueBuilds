#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

echo ====FSTAB BEFORE====
cat /etc/fstab
echo ====\n

# Your code goes here.
cat ./resources/base-fstab >> /etc/fstab

echo ====ADDITIONS====
cat ./resources/base-fstab
echo ====\n

echo ====FSTAB AFTER====
cat /etc/fstab
echo ====\n
