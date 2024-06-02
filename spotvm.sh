#!/bin/bash

set -e

cd /root/homebrew-tap

git add .
version=$(cat spotvm.rb | grep "version " | awk -F\" '{print $2}')
datetime=$(date +%F-%H-%M)
git commit -m "release spot ${version} by bot ${datetime}"
git push origin master
