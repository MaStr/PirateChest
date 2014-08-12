#!/bin/sh

serve_default_files_to_www() {
	src_folder=$1
  	dst_folder=$2
	cp -v  $src_folder/ncsi.txt  $dst_folder
	cp -vr $src_folder/cgi-bin   $dst_folder
	cp -v  $src_folder/redirect.html  $dst_folder
  
}

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

mv -v  $CHATFILE  $PIRATEBOX_FOLDER/

serve_default_files_to_www $WWW_FOLDER $PIRATECHEST_CLOSED_WWW
serve_default_files_to_www $WWW_FOLDER $PIRATECHEST_OPEN_WWW


mv    $WWW_FOLDER  $PIRATEBOX_FOLDER/www_old 
ln -s $PIRATECHEST_CLOSED_WWW  $WWW_FOLDER


sed -i 's|CHATFILE="$WWW_FOLDER/cgi-bin/data.pso"|CHATFILE="$PIRATEBOX_FOLDER/data.pso"|'   $1
sed -i 's|RESET_CHAT="yes"|RESET_CHAT="no"|' $1




