#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

ogver='$(cat /etc/os-release | grep OSTREE_VERSION | cut -d " -f 2)'
ogbuild='$(cat /etc/os-release | grep BUILD_ID | cut -d " -f 2)'

echo $ogver
echo $ogbuild

newbuild="$ogver-$ogbuild"

echo $newbuild

sed -i -e 's/$ogbuild/$newbuild/g' /etc/os-release