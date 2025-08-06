#!/bin/bash

echo "Creating directory Ravikant..."
mkdir Ravikant

echo "Changing to directory Ravikant..."
cd Ravikant || { echo "Failed to enter Ravikant"; exit 1; }

echo "Creating two files..."
touch firstFile secondFile

echo "Done! Files created:"
ls -l

