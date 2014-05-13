function add_alias(){
    #receives 2 arguments
    #adds an alias with name "arg1" and actual function "arg2"
    echo -e "alias $1=\"$2\"" >> ~/utm/Diploma/src/.siunl_aliases.sh
    . ~/.bashrc
}

function remove_alias(){
    unalias -a "$1"
    sed -i "/alias "$1"=/d" ~/utm/Diploma/src/.siunl_aliases.sh
    . ~/.bashrc
}

function remove_all_custom_aliases(){
    unalias -a "$1"
    echo "" > ~/utm/Diploma/src/.siunl_aliases.sh
    . ~/.bashrc
}

function siunl_aliases(){
    echo -e "================================================\n"
    grep "alias " ~/utm/Diploma/src/.siunl_aliases.sh
    echo -e "\n================================================"
}

######part II
function siunl_refresh(){
    . ~/.bashrc
}

function tellme(){
    # echo -e "\e[1m"
    if [ $1 = 'about' ] && [ $2 = 'os' ]; then
        echo -e 'using "cat /etc/os-release" \n'
        cat /etc/os-release
        # echo -e "\e[0m"
        return
    fi
    
    if [ $1 = 'about' ] && [ $2 = 'hardware' ] && [ $3 = 'platform' ]; then
        echo -e 'using "uname -i"\n'
        hp=$(uname -i)
        if [ $hp = "x86_64" ]; then
            echo -e "Your system is 64 bit (x86_64)"
        else
            echo -e "Your system is 32 bit (x86)"
        fi
        # echo -e "\e[0m"
        return
    else
        echo 'Sorry, I did not understand this one'
    fi
    # echo -e "\e[0m"
    return
}

function is(){
    return
}