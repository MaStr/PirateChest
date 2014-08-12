
. /opt/piratebox/conf/piratebox.conf

get_current_usage(){
	current_usage=`df $UPLOADFOLDER | tail -n 1 | awk '{ print $5 '} | sed '#s|%||'  `
}

check_filesystem_limit(){
	get_current_usage

	if [[ "$current_usage" -ge "$PIRATECHEST_MIN_DISKSPACE" ]] ; then
		return 0
	else
		return 1
	fi
}


generate_star_line(){
	local WISHED_MAX_STARS=$PIRATECHEST_WISHED_STARS
	local MAX_PERCENT=$PIRATECHEST_MIN_DISKSPACE

	local STARS=$(( $CURR_PERCENT * $WISHED_MAX_STARS / $MAX_PERCENT )) 
	local CNT_STARS=0
	local IT=0

	echo -n '|'
	until [ $WISHED_MAX_STARS  -lt $IT  ];
	do
		if [ "$STARS" -ge "$CNT_STARS" ] ; then
			echo -n '*'
			CNT_STARS=$(( $CNT_STARS + 1 ))
		else
			echo -n ' '
		fi

		IT=$(( $IT + 1 ))
	done;

	echo '|'
}


print_star_line_to_ui(){

	if [ -e $PIRATECHEST_CLOSED_FILE ] ; then
		generate_star_line > $PIRATECHEST_UPLOAD_LEFT_FILE
	fi

}

switch_www_folder(){
	local to_folder
	rm $WWW_FOLDER && ln $to_folder $WWW_FOLDER
}

check_and_change_status(){

	# Check if limit is reached
	if check_filesystem_limit ; then
		if [ ! -e $PIRATECHEST_OPEN_FILE ] ; then
		fi
	else
		if [ ! -e $PIRATECHEST_CLOSED_FILE ] ; then
		fi
		print_star_line_to_ui
	fi
}


if [[ "$1" == "cron" ]] ; then
	check_and_change_status
fi
