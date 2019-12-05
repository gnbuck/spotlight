#!/bin/bash

# WARNING: DO NOT FORGET TO UPDATE THE WINDOWSUSER VARIABLE IN ORDER TO MAKE THE SCRIPT WORK
# The script will take Spotlight images, place it in a temp folder in order to add .jpg extension and then save those to a folder into OneDrive

# Define Windows user
# Exits if variable is empty
WINDOWSUSER=
if test -e $WINDOWSUSER ; then
	echo "You MUST edit the WINDOWSUSER variable to make the script working"
	exit 1
fi

# Define folders
SPOTLIGHT=/mnt/c/Users/$WINDOWSUSER/AppData/Local/Packages/Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy/LocalState/Assets/
CACHE=/mnt/c/Users/$WINDOWSUSER/OneDrive/Pictures/SpotLight/.cache/
DEST=/mnt/c/Users/$WINDOWSUSER/OneDrive/Pictures/SpotLight/

#Create folders if not exist
echo "Checking working folders..."
if test -e "$CACHE"; then
	echo "$CACHE already exists."
else
        echo "Creating cache folder..."
        mkdir -p $CACHE
fi

if test -e "$DEST"; then
        echo "$DEST already exists."
else
        echo "Creating destination folder..."
        mkdir -p $DEST
fi

# Copy files into temp directory
echo "Copying files into temporary directory..."
cp -v $SPOTLIGHT* $CACHE

# Processing files
echo "Adding .jpg extensions to each file..."
for f in $CACHE*; do
        mv $f $f.jpg
	echo "Processing $f"
done

# Moving files to destination folder
mv -v $CACHE* $DEST

