DVORAK=`xinput list | grep TypeMatrix | grep keyboard | sed 's/.*id=\([0-9]*\).*/\1/'`
AZERTY=`xinput list | grep TypeMatrix | grep keyboard | sed 's/.*id=\([0-9]*\).*/\1/'`
setxkbmap -device $DVORAK dvorak -option compose:ralt
setxkbmap -device $AZERTY fr -option ""
