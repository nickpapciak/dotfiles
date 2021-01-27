function upload100
    cd ~/Programming/100-Days-of-Code
    git add *
    git commit -m $argv[1]
    git push origin master
end

