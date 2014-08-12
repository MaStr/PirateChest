#!/bin/sh

# ---- TEMPLATE ----

# Hook for modifcation stuff right after
#          piratebox/bin/install  ... part2 
# is run.

if [ !  -f $1 ] ; then
  echo "Config-File $1 not found..."
  exit 255
fi

#Load config
. $1

# You can uncommend this line to see when hook is starting:
echo "------------------ Running $0 ------------------"


echo "Removing Shared Folder from www"
rm -v $WWW_FOLDER/Shared

$PIRATEBOX_FOLDER/bin/install_piratebox.sh $1 hostname $PIRATECHEST_HOST

