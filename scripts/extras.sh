alias ki='cd ~/workspace/misc/kirei'
alias kirei='ki && cd src && ghci'
alias kirei+='ki && subl . && cd src && ghci'
alias killz='/Users/anelson/workspace/python/killproc.py'

# misc configuration items
export QUIVER2_DB=quiver2_press_stg
alias llama='cd ~/workspace/languages/llama/language-llama'
alias llama_='llama && subl .. && pwd && ls && ghcio -isrc Language.Llama.Types.TypeCheck'

# alias quill='apps && act && python src/quill/server.py'
alias ghcio='ghci -XOverloadedStrings'
alias langs='cd ~/workspace/languages'
alias sargs='cd ~/workspace/python/simpleargs'
alias cbe='cabal exec'
alias hs='ws && cd haskell'
alias s3s='hs && cd s3-streams'
alias cbi='cabal sandbox init'
alias fed='cd ~/workspace/haskell/fedallah'
alias fed_='cd && subl fedallah rowling && cd fedallah'
alias s='subl . &> /dev/null'
alias snippets='subl /Users/anelson/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Snippets'
alias ci='cabal install'
alias cui='cabal update && cabal install'
alias crs='cabal repl spec'
alias py='cd ~/workspace/python'
alias haddock='cabal haddock --internal --executables --hyperlink-source'
alias dev='git checkout develop'

shttp() {
    curl -s icanhazip.com; python -m  SimpleHTTPServer 8000
}

alias search='yaourt -Ss'
alias get='yaourt -S'
alias ta='tmux attach'
alias t='git snake test'
alias remove='yaourt -R'
alias ei3='e ~/.i3/config'
alias lock='xscreensaver-command --lock'
alias rr='pga && act && cd src/ns_data_pga/round_recap'
alias grip='grep -i'
alias gsb='git snake build -d'
alias update='yaourt -Syyu'
alias tn='git snake test -n'
alias prs='cd ~/narr/ns_data/ns_data_parsing'
alias cliact='source ~/narr/ns_services/quill_development_toolkit/cli/vendor/python/bin/activate'
alias rmpkg='yaourt -R'
alias grep='grep --color=auto'
alias egui='emacs'
alias emcs='emacs -nw'
alias sf='cd ~/workspace/software-foundations/coqfiles'
alias dt='cd ~/narr/ns_data'
alias sl='ls'
alias duh='du -h'
alias music='cd ~/Music'
alias coq='cd ~/workspace/coq'
alias onprem='cd ~/narr/ns_systems/on_prem'
alias cd..='cd ..'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias venv='virtualenv venv; source venv/bin/activate'
alias onp='lsi -p vpc-onprem'
alias nsp="nix-shell --pure -I root=$NARR -I /home/anelson/narr/RND-Data"
nixi() {
    nix-env -iA "nixpkgs.$1"
}
nsnixi() {
    nix-env -f '<nsnix>' --arg nsroot \"$NARR\" -iA $1 --show-trace
}
alias nsnix='narr; cd RND-Data/nsnix'

alias ncg='nix-collect-garbage -d'
pyrm() {
  nix-env -e "python2.7-$1"
}
alias egit='e ~/.zsh/git.sh'
alias sys='cd ~/narr/ns_systems'
alias adf='dapps; cd ns_analytics_default'
alias nb='nix-build'
alias lsp='PAGER= nix-env -q'
nixrm() {
    lsp | egrep $1 | xargs nix-env -e
}
alias rnd='cd $NARR/RND-Data'
alias nse='nix-shell --pure -A env'

# Show disk space on machines matching filters.
function dspace() {
  lsi $@ -c 'df -h | head -n 2 | tail -n 1' -y
}

# Show what is taking up disk space on machines matching filters.
function whatspace() {
  lsi $@ -c 'sudo du / | sort -nsr | head -n 20' -y
}

# Makes a tempdir and records it.
mktempdir() {
    local tdir=$(mktemp -d /tmp/tempdir-XXXXX)
    echo $tdir >> ~/.current_tempdirs
    echo $tdir
}

tempdir() {
    cd $(mktempdir)
}

retempdir() {
    cd $(tail -n 1 ~/.current_tempdirs)
}

rmtempdirs() {
    for d in $(cat ~/.current_tempdirs); do
        echo "Removing $d"
	sudo rm -fr $d
    done
    cat /dev/null > ~/.current_tempdirs
}

alias enix='e $ZSH_PROFILE/nix.sh'
alias enix='e $ZSH_CONFIG/nix.sh'
alias ans='cd ~/narr/ns_systems/on_prem/ansible_installer'

# Tells you where an alias is defined
function where() {
  grep --exclude='#*' -R "alias ($1)" $ZSH_CONFIG
}

# Greps current directory for a pattern
function findhere() {
  grep -r $1 .
}

# Appends another alias to the `extras` file.
function add() {
   echo "alias $1='$2'" >> $ZSH_CONFIG/extras.sh && reload
}

alias showpath='echo $PATH | tr ":" "\n"'
alias copy='xsel -ib'
alias paste='xsel -ob'
alias ns='nix-shell'
alias e_='emacsclient -nw'
psa() {
  local cmd='ps auxww'
  for filter in "$@"; do
    cmd+=" | ag $filter"
  done
  bash -c "$cmd"
}
alias vgr='cd ~/narr/vagrantboxes'
alias sdev='cd ~/narr/ns_systems/on_prem/dev'
function findit {
  readlink -f $(which $1)
}
alias vdf='vagrant destroy -f'

alias time='/usr/bin/env time'
alias enw='emacsclient -nw'
alias qosx='cd ~/narr/vagrantboxes/quill-osx && vagrant ssh'

whichl() {
  ls -l $(which $1)
}
export PATH="$PATH:$HOME/.npm/bin"
alias nnp='cd /home/anelson/workspace/nix/nix-node-packages'

export WS=$HOME/workspace