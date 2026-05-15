ogver='$(cat /etc/os-release | grep OSTREE_VERSION | cut -d " -f 2)'
ogbuild='$(cat /etc/os-release | grep BUILD_ID | cut -d " -f 2)'

newbuild="$ogver-$ogbuild"

sed -i -e 's/$ogbuild/$newbuild/g' /etc/os-release