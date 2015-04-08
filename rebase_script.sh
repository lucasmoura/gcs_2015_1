#!/bin/bash

clear
rm -rf rebase_test/

mkdir rebase_test
cd rebase_test

echo -e "This script will show a quick example of using rebase\n\n"

#Creating test file on master branch
echo -e "Creating a test file with the command touch test.txt...\n"
touch test.txt
echo -e "Writing on the test file the content: Master branch line with the
command echo Master branch line>test.txt \n"
echo "Master branch line">test.txt

echo -e "Adding the file to the tracked list with git add test.txt"
git add test.txt
echo -e "Commiting the file..."
echo -e "git commit -q -m 'Creating test file'\n"
git commit -q -m "Creating test file"

echo -e "Displaying content of test file..."
echo -e "cat test.txt\n"
cat test.txt
echo -e "\n\n"

read -p "Press any key to continue...`echo $'\n\n> '`" -n1 -s

#Creating new branch which the rebase will be applied on
echo -e "Moving to branch new_feature"
echo -e "git checkout -b new_feature\n"
git checkout -b new_feature
echo -e "Appending to test file the line: new feature branch line"
echo -e "new feature bracnh line >> test.txt\n"
echo "new feature branch line" >> test.txt

echo -e "Displaying content of test file..."
echo -e "cat test.txt\n"
cat test.txt

echo -e "\ngit add test.txt"
git add test.txt
echo -e "git commit -q -m 'Adding line to test file'"
git commit -q -m  "Adding line to test file"

echo -e "\nDisplaying the log of the new_feature branch"
echo -e "git log --oneline\n"
git log --oneline

echo -e "\n\n"
read -p "Press any key to continue...`echo $'\n> '` " -n1 -s

#Moving back to master branch
echo -e "Changing back to master branch"
echo -e "git checkout master\n"
git checkout master
echo -e "Creating new_file.txt with the content: new file"
echo -e "touch new_file.txt"
touch new_file.txt
echo -e "new file > new_file.txt\n"
echo "new file" > new_file.txt

echo -e "git add new_file.txt"
git add new_file.txt
echo -e "git commit -q -m 'Creating new file'"
git commit -q -m  "Creating new file"

read -p "Press any key to continue...`echo $'\n> '` " -n1 -s

#Moving to new_feature branch to perform the rebase
echo -e "Moving back to new_feature branch"
echo -e "git checkout new_feature\n"
git checkout new_feature
echo -e "It can be seen that there is no new_file.txt on this branch...\n"
ls

echo -e "\nThe rebase operation will be displayed now"
echo -e "git rebase master\n"
git rebase master

echo -e "\nNow the file can be seen on the branch\n"
ls
echo -e "\n\n"

read -p "Press any key to continue...`echo $'\n> '` " -n1 -s

#Changing to master branch in order to perform the clean merge
echo -e "Moving back to master branch to perform the merge command"
echo -e "git checkout master\n"
git checkout master
echo -e "git merge new_feature\n"
git merge new_feature

echo -e "Displaying edited test file"
echo -e "cat test.txt\n"
cat test.txt

echo -e "\nDisplaying log"
echo -e "git log --oneline\n"
git log --oneline

git branch -d new_feature

