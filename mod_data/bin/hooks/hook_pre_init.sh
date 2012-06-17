#!/bin/sh

# ---- TEMPLATE ----

# Hook for modifcation stuff before 
#          piratebox/bin/install  ... part2 
# is run.

if [ !  -f $1 ] ; then
  echo "Config-File $1 not found..."
  exit 255
fi

#Load config
. $1

# You can uncommend this line to see when hook is starting:
# echo "------------------ Running $0 ------------------"

mv $PIRATEBOX_FOLDER/www  $PIRATEBOX_FOLDER/www_old 
ln -s $PIRATEBOX_FOLDER/www_old $PIRATEBOX_FOLDER/www_piratechest_closed


