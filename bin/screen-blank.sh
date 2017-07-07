DUR="$(xset q | grep Standby | cut -d' ' -f4)"
xset s off
case $DUR in
    7200) xset dpms 900 900 900;echo "Screen blank set to 15 mins.";;
    *) xset dpms 7200 7200 7200;echo "Screen blank set to 2 hours.";;
esac
