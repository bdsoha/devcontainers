not_exists() {
    if [ ! -f $1 ]; then 
        echo 1
    else 
        echo 0
    fi
}

exists() {
    if [ ! -f $1 ]; then 
        echo 1
    else 
        echo 0
    fi
}