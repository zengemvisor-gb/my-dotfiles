set -gx EDITOR nvim
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITOR
set -gx DOTREPO "$HOME/my-dotfiles"
# Cursor styles
set -gx fish_vi_force_cursor 1
set -gx fish_cursor_default block
set -gx fish_cursor_insert line blink
set -gx fish_cursor_visual block
set -gx fish_cursor_replace_one underscore

# Path
set -x fish_user_paths
fish_add_path ~/.local/bin
fish_add_path ~/.luarocks/bin
fish_add_path ~/Library/Python/3.{8,9}/bin
fish_add_path /usr/local/opt/sqlite/bin
fish_add_path /usr/local/sbin
fish_add_path ~/.gem/ruby/2.6.0/bin
fish_add_path ~/.local/bin/pnpm
fish_add_path /bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/share/bob/nvim-bin
fish_add_path /var/lib/flatpak/exports/bin/
fish_add_path ~/.dotnet/tools
fish_add_path /home/linuxbrew/.linuxbrew/bin
fish_add_path ~/.config/emacs/bin
fish_add_path ~/bin/

# deno
set -gx DENO_INSTALL "~/.deno"
fish_add_path ~/.deno/bin

# Fish
set fish_emoji_width 2
alias fish_greeting color-test

# dotdrop
alias dotdrop "$DOTREPO/dotdrop.sh"
alias dotgit "git -C $DOTREPO"
alias dotsync "dotgit pull && dotgit add -A && dotgit commit && dotgit push; dotdrop install"

# Emacs
# set -l emacs_path /Applications/Emacs.app/Contents/MacOS
# set -Ux EMACS $emacs_path/Emacs
# fish_add_path ~/.emacs.d/bin
# alias emacs $EMACS

# Go
set -x GOPATH ~/go
fish_add_path $GOPATH $GOPATH/bin


#fish_add_path -m /etc/profiles/per-user/folke/bin /run/current-system/sw/bin
# Exports
set -x LESS -rF
set -x COMPOSE_DOCKER_CLI_BUILD 1
set -x HOMEBREW_NO_AUTO_UPDATE 1
set -x HOMEBREW_NO_ENV_HINTS 1
# set -x DOTDROP_AUTOUPDATE no
# set -x MANPAGER "nvim +Man!"
# set -x MANROFFOPT -c
# set -x OPENCV_LOG_LEVEL ERROR

# set -x NNN_FIFO "/tmp/nnn.fifo"
# set -x NNN_PLUG "f:finder;o:fzopen;p:mocq;d:diffs;t:nmount;v:imgview;z:z"
#set -x MANPAGER "sh -c 'col -bx | bat -l man -p'" # use bat to format man pages
#set -x MANPAGER "most" # use bat to format man pages
#
#abbr -a --position anywhere --set-cursor -- -h "-h 2>&1 | bat --plain --language=help"

# Dnf
# abbr dnfi 'sudo dnf install'
# abbr dnfs 'sudo dnf search'
# abbr dnfr 'sudo dnf remove'
# abbr dnfu 'sudo dnf upgrade --refresh'

# Files & Directories
abbr mv "mv -iv"
abbr cp "cp -riv"
abbr mkdir "mkdir -vp" # verbose, make parent directories as needed, and don't prompt before creating
# alias ls "nnn -e"
# alias ls="eza --color=always --icons --group-directories-first"
alias la 'eza --color=always --icons --group-directories-first --all'
alias ll 'eza --color=always --icons --group-directories-first --all --long'
abbr l ll
abbr ncdu "ncdu --color dark"
abbr servs "systemctl --type=service --state=running"
abbr rstssh "sudo systemctl restart ssh"



# Editor
abbr vv gnvim
abbr lv lazyvim

# Vim distributions
alias lazyvim "NVIM_APPNAME=lazyvim nvim"
alias rafi "NAVIM_APPNAME=rafi nvim"
alias ecovim "NVIM_APPNAME=ecovim nvim"

abbr nvim nvim

alias bt "mcoredumpctl -1 gdb -A '-ex \"bt\" -q -batch' 2>/dev/null | awk '/Program terminated with signal/,0' | bat -l cpp --no-pager --style plain"

function cfgfish
    nvim ~/.config/fish/config.fish
    reload
end

function reload
    echo "reloading fish config"
    source ~/.config/fish/config.fish
end

function up
    cd ..
end

# Dev
abbr gg lazygit

alias tn "npx --no-install ts-node --transpile-only"

abbr tt "tn src/tt.ts"

# Other
abbr df "grc /bin/df -h"
abbr ytop btm
abbr gotop btm
abbr fda "fd -IH"
abbr rga "rg -uu"
abbr grep rg
abbr suod sudo
abbr helpme "bat ~/HELP.md"
abbr weather "curl -s wttr.in/27587 | grep -v Follow"
abbr show-cursor "tput cnorm"
abbr hide-cursor "tput civis"
abbr aria2c-daemon "aria2c -D"
alias gnome-control-center "env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"

# systemctl
abbr s systemctl
abbr su "systemctl --user"
abbr ss "command systemctl status"
abbr sl "systemctl --type service --state running"
abbr slu "systemctl --user --type service --state running"
abbr se "sudo systemctl enable --now"
abbr sd "sudo systemctl disable --now"
abbr sr "sudo systemctl restart"
abbr so "sudo systemctl stop"
abbr sa "sudo systemctl start"
abbr sf "systemctl --failed --all"

# journalctl
abbr jb "journalctl -b"
abbr jf "journalctl --follow"
abbr jg "journalctl -b --grep"
abbr ju "journalctl --unit"

direnv hook fish | source
set -g direnv_fish_mode disable_arrow

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set --export PASSWORD_STORE_ENABLE_EXTENSIONS true
set --export PASSWORD_STORE_EXTENSIONS_DIR "/home/linuxbrew/.linuxbrew/opt/python@3.11/lib/python3.11/site-packages/usr/lib/password-store/extensions/"
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# Starship
function starship_transient_prompt_func
    starship module character
end

function starship_transient_rprompt_func
    starship module time
end

# if not set -q ZELLIJ
#     if test "$ZELLIJ_AUTO_ATTACH" = "true"
#         zellij attach -c
#     else
#         zellij
#     end
#
#     if test "$ZELLIJ_AUTO_EXIT" = "true"
#         kill $fish_pid
#     end
# end


#
# if status is-interactive
#     eval (zellij setup --generate-auto-start fish | string collect)
# end

# atuin
#set -gx ATUIN_NOBIND true

atuin init fish | source

#bind \cr _atuin_search
#bind -M insert \cr _atuin_search
#bind \e\[A _atuin_up

# vscode fish
string match -q "$TERM_PROGRAM" vscode
and . (code --locate-shell-integration-path fish)

zoxide init fish | source
starship init fish | source

function zr
    command zellij run --name "$argv" -- fish -c "$argv"
end
function zrf
    command zellij run --name "$argv" --floating -- fish -c "$argv"
end
function ze
    command zellij edit $argv
end
function zef
    command zellij edit --floating $argv
end

export PATH="$PATH:/home/gil/.kit/bin"
export PATH="$PATH:/home/gil/.kenv/bin"
