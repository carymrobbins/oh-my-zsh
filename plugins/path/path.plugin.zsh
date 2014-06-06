function reload_path() {
    if [ $CUSTOM_PATH ]; then
        export ORIGINAL_PATH=$(echo $PATH | sed "s|$CUSTOM_PATH||")
    else
        export ORIGINAL_PATH=$PATH
    fi
    export CUSTOM_PATH=$(eval echo $((while read x; do echo -n "$x:"; done < $HOME/.path) 2> /dev/null || echo ""))
    export PATH=${CUSTOM_PATH}${ORIGINAL_PATH}
}

reload_path
