#!/usr/bin/env bash
#=====================================#
#  Deply files to cdn.easybash.sh     #
#=====================================#

# Reset and update Git
git stash
git stash clear
git pull origin master

# Download the latest release from easybash's repository.
rm latest.tar.gz
wget https://github.com/terrylinooo/easybash/archive/${1}.tar.gz
tar -zxvf ${1}.tar.gz
mv -T ./easybash-${1} ./easybash-latest
rm ${1}.tar.gz
find easybash-latest/ -type f -iname "*.sh" -exec chmod +x {} \;
rm easybash-latest/readme.md
rm easybash-latest/.gitignore
rm -rf easybash-latest/examples
rm -rf easybash-latest/test

# package all files to latest.tar.gz
rm easybash.tar.gz

tar -zcvf easybash.tar.gz easybash-latest
rsync -a easybash-latest/* ./
rm -rf easybash-latest


#git add .
#git commit -m "[update] $(date '+%Y-%m-%d %H:%M:%S')"
#git push origin master

echo "Data updated."
