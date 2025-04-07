#!/bin/bash

echo "Marking repository as safe..."
git config --global --add safe.directory "$GITHUB_WORKSPACE"

echo "Setting up Git user..."
git config user.name "ir-paras-oli"
git config user.email "paras.oli@invisirisk.com"

echo "Creating a folder and adding a file..."
mkdir -p new_folder
echo "Some new content" > new_folder/new6-file.txt

git add new_folder/new6-file.txt
git commit -m "Add a new file inside new_folder"

echo "Pushing changes to the STAGE branch..."
git checkout -b STAGE 2>/dev/null || git checkout STAGE
git remote set-url origin https://x-access-token:${GITHUB_TOKEN}@github.com/${REPO}.git
git push -u origin STAGE
