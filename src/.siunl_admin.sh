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
function siunl_load_aliases(){
    . ~/.bashrc
}

function siunl_load_auto_complete(){
    sudo cp -r ~/utm/Diploma/src/auto-complete/. /etc/bash_completion.d/

    #Load/source new completion files
    FILES=~/utm/Diploma/src/auto-complete/*
    for f in $FILES
    do
        . /etc/bash_completion.d/${f##*/}
    done
}

function siunl_refresh(){
    siunl_load_aliases
    siunl_load_auto_complete
}