function shelly(){
    query=${@,,}
    length=$(($#-1))
    all_but_last=${@:1:$length}
    username=$(getent passwd $LOGNAME | cut -d: -f5 | cut -d, -f1)

    if [ "${all_but_last,,}" == "do i have" ]; then
        echo -e 'Using: command -v ${@: -1} 2>/dev/null 1>/dev/null && { echo >&1 "Yes. You can launch it using '"$(command -v ${@: -1})"' OR you can try '"${@: -1}"'"; } || { echo >&2 "It seems that - ${@: -1} - is not installed."; }'
        command -v ${@: -1} 2>/dev/null 1>/dev/null && { echo >&1 "Yes. You can launch it using '"$(command -v ${@: -1})"' OR you can try '"${@: -1}"'"; } || { echo >&2 "It seems that - ${@: -1} - is not installed."; }
        return
    fi

    if [ "$query" = "whats my system" ]; then
        _arch=$(uname -i)
        if [ $_arch == x86_64 ]; then
            _arch="64 bit (x86_64)"
        else
            _arch="32 bit (x86)"
        fi

        _system=$(uname)
        IFS='\n' read -r non_parsed_name <<< "$(cat /etc/os-release)"
        IFS='=' read -a parsed_name <<< "$non_parsed_name"
        _distro=${parsed_name[1]}
        echo "You are on "$_system" "${_arch}". Distribution name: "$_distro"."
        return
    fi

    if [ "$query" = "update apps" ] || [ "$query" = "update applications" ]; then
        echo -e "Using: sudo apt-get -q -q update; sudo apt-get -y -q -q upgrade"
        echo "Refreshing the list of repos..."
        sudo apt-get -q -q update
        echo "Updating apps..."
        sudo apt-get -y -q -q upgrade
        echo "Done!"
        return
    fi

    if [ "$query" = "update system" ] || [ "$query" = "update os" ] || [ "$query" = "update distro" ] || [ "$query" = "update distribution" ]; then
        echo -e "Using: sudo apt-get -y -q -q dist-upgrade"
        echo "Updating distro..."
        sudo apt-get -y -q -q dist-upgrade
        echo "Done!"
        return
    fi

    if [ "$query" = "update os and apps" ] || [ "$query" = "update all" ] || [ "$query" = "update system and apps" ] || [ "$query" = "update apps and os" ] || [ "$query" = "do full update" ]; then
        echo -e "Using: sudo apt-get -q -q update; sudo apt-get -y -q -q upgrade; sudo apt-get -y -q -q dist-upgrade"
        echo "Refreshing the list of repos..."
        sudo apt-get -q -q update
        echo "Updating apps..."
        sudo apt-get -y -q -q upgrade
        echo "Updating distro..."
        sudo apt-get -y -q -q dist-upgrade
        echo "Done!"
        return
    fi

    if [ "$query" = "whats my username" ] || [ "$query" = "who am i" ] || [ "$query" = "whoami" ] || [ "$query" = "username" ] || [ "$query" = "tellme my username" ] || [ "$query" = "tell me my username" ]; then
        echo "Using: getent passwd $LOGNAME | cut -d: -f5 | cut -d, -f1"
        echo "You are: $username"
        return
    fi

    ############FUN##########################
    if [ "$query" = "whats the meaning of life" ] || [ "$query" = "why do we live" ]; then
        echo -e "IMHO, we live to eat, sleep, rave, repeat.\nNevertheless, the RIGHT answer is 42."
        return
    fi

    if [ "$query" = "do you love me" ] || [ "$query" = "i love you" ]; then
        echo -e "You are my only and dearest person, $username. My fans go crazy the moment you touch the keyboard."
        if [ "$query" = "i love you" ]; then
            echo -e "I love you too!"
        else
            echo -e "Of course I love you!"
        fi
        return
    fi

    if [ "$query" = "will you marry me" ] ; then
        shelly do you love me
        echo -e "I would, for sure. However I fear that our hardware is not compatible... yet"
        return
    fi

    echo 'Sorry, I did not understand this one. Teach me, Master!' 
   return
}

function tellme(){
    query=${@,,}

    if [ "$query" = "about os" ] || [ "$query" = "about my os" ] || [ "$query" = "about my system" ]; then
        echo -e 'Using: cat /etc/os-release\n'
        cat /etc/os-release
        return
    fi
    
    if [ "$query" = "about my hardware platform" ] || [ "$query" = "about my arch" ]; then
        echo -e 'Using: uname -i\n'
        hp=$(uname -i)
        if [ $hp = "x86_64" ]; then
            echo -e "Your system is 64 bit (x86_64)"
        else
            echo -e "Your system is 32 bit (x86)"
        fi
        return
    fi
    if [ "$query" = "about my package manager" ]; then
        _PMANAGER_DETERMINE
        echo -e "Your package manager is $_PMANAGER"
        return
    else
        echo 'Sorry, I did not understand this one. Teach me, Master!'
    fi
    return
}

function _PMANAGER_DETERMINE(){
    _PMANAGER="UNDEFINED"
    #Determine package manager
    if [ -f /usr/bin/apt-get ]; then
        _PMANAGER="APT"
    fi
    if [ -f /usr/bin/yum ]; then
        _PMANAGER="YUM"
    fi
    if [ -f /usr/bin/zypper ]; then
        _PMANAGER="ZYPPER"
    fi
}

function please(){
    query=${@,,}
    _PMANAGER_DETERMINE

    if [ "$query" = "do full update" ]; then
        if [ "$_PMANAGER" = "APT" ]; then
            sudo apt-get update
            sudo apt-get upgrade
            sudo apt-get dist-upgrade
        fi
    else
        echo 'Sorry, I did not understand this one. Teach me, Master!'
    fi
    return
}