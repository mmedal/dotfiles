if status is-interactive
    # vi mode
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore
    fish_vi_key_bindings

    # zoxide
    zoxide init --cmd cd fish | source

    # Starship setup
    starship init fish | source

    # yazi
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

    # aliases
    alias ls='eza -a'
    alias ll='eza -la'
    alias lg='lazygit'

    # env vars
    set -gx EDITOR nvim
end

# Homebrew setup
/opt/homebrew/bin/brew shellenv | source

# asdf setup
source /opt/homebrew/opt/asdf/libexec/asdf.fish
