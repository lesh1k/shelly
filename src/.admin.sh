function add_alias(){
    #receives 2 arguments
    #adds an alias with name "arg1" and actual function "arg2"
    echo -e "alias $1=\"$2\"" >> ~/utm/Diploma/src/.aliases.sh
    . ~/.bashrc
}

function remove_alias(){
    unalias -a "$1"
    sed -i "/alias "$1"=/d" ~/utm/Diploma/src/.aliases.sh
    . ~/.bashrc
}

function remove_all_custom_aliases(){
    unalias -a "$1"
    echo "" > ~/utm/Diploma/src/.aliases.sh
    . ~/.bashrc
}

function shelly_aliases(){
    echo -e "================================================\n"
    grep "alias " ~/utm/Diploma/src/.aliases.sh
    echo -e "\n================================================"
}

######part II
function shelly_load_aliases(){
    echo "Reloading aliases..."
    . ~/.bashrc
    echo "Done!"
}

function shelly_load_auto_complete(){
    echo "Reloading auto-complete..."
    echo "Copying files..."
    sudo cp -r ~/utm/Diploma/src/auto-complete/. /etc/bash_completion.d/

    echo "Loading newly added/edited auto-completion files..."
    #Load/source new completion files
    FILES=~/utm/Diploma/src/auto-complete/*
    for f in $FILES
    do
        . /etc/bash_completion.d/${f##*/}
    done
    echo "Done!"
}

function shelly_reload(){
    shelly_load_aliases
    shelly_load_auto_complete
}