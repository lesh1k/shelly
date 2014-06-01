

#####SIUNL/Shelly/human.sh############
if [ -f $SHELLY/src/.aliases.sh ]; then
    . $SHELLY/src/.aliases.sh
fi

if [ -f $SHELLY/src/.admin.sh ]; then
    . $SHELLY/src/.admin.sh
fi

if [ -f $SHELLY/src/.commands.sh ]; then
    . $SHELLY/src/.commands.sh
fi
###############################