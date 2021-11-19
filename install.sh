check_clang(){
        local clang_exist=0
        for i in $(echo $PATH | tr ":" "\n")
        do
                if [ -f "$i/clang-format" ]
                then
                        clang_exist=1
                fi
        done
        if [ $clang_exist = 0 ]
        then
                echo "Please install clang format!"
                exit -1
        fi
}

check_clang

cp cformat.sh /bin/cformat
chown root:root /bin/cformat
chmod 755 /bin/cformat
