#!/bin/sh
#
# hman - interface to the man2html scripts
#
# Michael Hamilton <michael@actrix.gen.nz>, Apr 1996
# Andries Brouwer <aeb@cwi.nl>, Jan 1998.
#
# Usage examples:
#        hman                    - get start page
#        hman man2html           - get man page for man2html
#        hman 7 locale           - get section 7 man page for locale 
#        hman 1                  - section 1 index of names only
#        hman 3 index            - section 3 index names+descriptions
#        hman -k editor          - search all man pages for some string
#	 hman -P arena ./twm.man - specify browser; specify man page
#
# hman from %version%
#

if [ x"$1" = x"-v" ] || [ x"$1" = x"-V" ]; then
	echo "`basename $0` from %version%"
	exit 0
fi

# The user has to set MANHTMLPAGER (or he will get httpd-free lynx).
# Pick your favorite browser: lynx, xmosaic, netscape, arena, amaya, grail, ...
if [ x"$MANHTMLPAGER" = x ]  && ! which lynx > /dev/null ; then
	HMAN_BROWSER=sensible-browser
else
	HMAN_BROWSER=${MANHTMLPAGER-lynxcgi}
fi

#
# If the man pages are on a remote host, specify it in MANHTMLHOST.
HOST=${MANHTMLHOST-localhost}

# Perhaps the browser was specified on the command line?
if [ "$#" -gt 1 ] && [ x"$1" = x"-P" ]; then
    HMAN_BROWSER="$2"
    shift; shift
fi

# Perhaps the host was specified on the command line?
if [ "$#" -gt 1 ] && [ x"$1" = x"-H" ]; then
    HOST="$2"
    shift; shift
fi

# Interface to a live (already running) netscape browser.
nsfunc () {
	if ( /bin/ps xc | grep -q 'netscape$' ) ; then
		if [ -x  netscape-remote ] ; then
			exec netscape-remote  -remote "openURL($1,new_window)"
		else
			exec netscape -remote "openURL($1,new_window)"
		fi
	else
		netscape $1 &
	fi
}

urlencode() {
	echo "$@" | perl -pe 'chomp(); s/([^A-Za-z0-9\ \_\-\.\/])/"%" . unpack("H*", $1)/eg; tr/ /+/;'
}


case "$HMAN_BROWSER" in
     lynxcgi)
	HMAN_BROWSER=lynx
	CG="lynxcgi:/usr/lib/cgi-bin/man"
	;;
     netscape)
        HMAN_BROWSER=nsfunc
        CG="http://$HOST/cgi-bin/man"
	;;
     *)
	CG="http://$HOST/cgi-bin/man"
	;;
esac

  case "$#" in
     0)   $HMAN_BROWSER "$CG/man2html" ;;
     1)   case "$1" in
	    1|2|3|4|5|6|7|8|l|n)
		$HMAN_BROWSER "$CG/mansec?query=$1" ;;
	    /*)
		$HMAN_BROWSER "$CG/man2html?query=`urlencode "$1"`" ;;
	    */*)
		$HMAN_BROWSER "$CG/man2html?query=`urlencode "$PWD/$1"`" ;;
	    *)
		$HMAN_BROWSER "$CG/man2html?query=`urlencode "$1"`" ;;
          esac ;;
     2)   case "$1" in
            -k)
                $HMAN_BROWSER "$CG/mansearch?query=`urlencode "$2"`" ;;
            *)
		if [ "$2" = index ]; then
		    $HMAN_BROWSER "$CG/manwhatis?query=`urlencode "$1"`"
                else
		    $HMAN_BROWSER "$CG/man2html?query=`urlencode "$1 $2"`"
                fi ;;
          esac ;;
     *)   echo "bad number of args" ;;
  esac

exit 0
