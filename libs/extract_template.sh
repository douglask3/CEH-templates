#!/usr/bin/env sh

git clone https://github.com/douglask3/CEH-templates.git CEH-templates-tempRepo
cd CEH-templates-tempRepo
git remote rm origin
mkdir tempFile
git mv $1 tempFile/
git filter-branch --subdirectory-filter tempFile/ -- --all
git add .
git commit -m "extracting template from https://github.com/douglask3/CEH-templates.git for use"

cd ..
git remote add CEH-templates-tempBranch CEH-templates-tempRepo
git pull CEH-templates-tempBranch master
git remote rm CEH-templates-tempBranch