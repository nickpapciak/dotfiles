if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
fish_add_path /Users/narfee/.spicetify

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/narfee/Developer/miniconda3/bin/conda
    eval /Users/narfee/Developer/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

set fish_greeting
set -x JAVA_HOME (/usr/libexec/java_home -v 11)


# only print in iTerm startup
switch (pstree -p $fish_pid | string split0)
case "*iTerm2*"
    /usr/local/bin/mfetch
end

if test "$TERM_PROGRAM" = "ghostty"
    mfetch
end

# Created by `pipx` on 2023-05-24 15:05:21
set PATH $PATH /Users/narfee/.local/bin
