#!/bin/sh
git --version

# github info, could be pass by argv
branch=${2:-v2.1_bundle}
repo=${3:-http://10.1.10.111/qtp/crypto-qtp-front.git}
date=`date +%Y-%m-%d`
commit_log="generate bundle for testing on ${date}"

# gulp build
# --depth Create a shallow clone with a history truncated to the specified number of revisions
# 簡單來說就是把太久以前不需要的歷史給丟掉，大於給定數量以前的commit紀錄就會被忽略，
# 進而省下clone時頻寬、空間及時間，這點在數千到數萬個commits以上的repository理面效果會非常明顯

rm -rf build
git clone $repo --depth 1 -b $branch build

yarn run build-force

rm -rf build/*

# mv dist/static/index.html build/

cp -r dist/. build/

pushd build
rm dist/.DS_Store
git add . -f

# commit
echo $commit_log
git commit -a -m "$commit_log"

# push
git push origin $branch -f

cd ..

rm -rf build
