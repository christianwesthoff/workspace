#!/bin/bash

echo "Enter Github access token: "
read TOKEN

OWNER="christianwesthoff"
REPO="workspace"
URL="https://api.github.com/repos/$OWNER/$REPO"
FILES=(.zshrc .brew-packages .vscode-extensions)

for filen in "${FILES[@]}"
do
	curl --header 'Authorization: token $TOKEN' \
     --header 'Accept: application/vnd.github.v3.raw' \
     --remote-name \
     --location $URL/$file >> ~/$file
done

source ~/.zshrc
