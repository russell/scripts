#!/bin/sh
EMACS=emacs
EMACSCLIENT=emacsclient

tempuid=`id -u`
temphost=`hostname`
EMACSSERVER=/tmp/emacs$tempuid/server

if [ -f $HOME/.emacsconfig ];
then
    . $HOME/.emacsconfig
fi

if [ -z "$DISPLAY" ];
then
    exec $EMACS "$@"
else
    if [ -e "$EMACSSERVER" ];

    then
	exec $EMACSCLIENT "$@"
    else 
	exec $EMACS &
	while [ ! -e "$EMACSSERVER" ] ;
	do 
	    sleep 1 ;
	done 
	exec $EMACSCLIENT "$@"
    fi
fi

