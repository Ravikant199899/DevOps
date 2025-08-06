#!/bin/bash
echo "Committing and pushing changes..."
git add .
echo -n "Enter commit message: "
read msg
git commit -m "$msg"
git push origin main
