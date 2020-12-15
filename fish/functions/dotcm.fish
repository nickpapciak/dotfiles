function dotcm
    dotfiles
    git add *
    git commit -m $argv[1]
    git push origin master
end

