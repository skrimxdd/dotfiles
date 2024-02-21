fish_config theme choose "Dracula Official"


if status is-interactive
	afetch
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting ""

function fish_prompt
    set -l cwd (prompt_pwd)
    set -l home (string escape $HOME)

    set_color -o white
    echo -n "["
    set_color -o cyan
    echo -n "$USER"
    set_color -o white
    echo -n "]─["
    set_color -o cyan
    echo -n "$cwd"
    set_color -o white
    echo -n "]─❯ "
end
