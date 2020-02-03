#!/usr/bin/env bash

git_clone_url=https://github.com/nephelaiio/ansible-role-rxvt-unicode.git
OK=0
KO=1

# verify requirements
requirements=(ansible-playbook git)
for r in ${requirements[@]}; do
    if ! r_path=$(type -p $r); then
        echo "$r executable not found in path, aborting"
        exit $KO
    fi
done

# create temp dir
tmpdir="$(mktemp -d -t rxvt-unicode-XXXXXXXXXX)"

# install role locally
pushd $tmpdir
git clone $git_clone_url
pushd $(basename $git_clone_url .git)
ansible-playbook --connection=local --inventory inventory install/playbook.yml
popd
popd

# purge temp files
rm -rf $tmpdir
exit $OK
