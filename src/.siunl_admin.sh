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