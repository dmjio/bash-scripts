# Include these manpaths so that installed packages have manpages.
export MANPATH=~/.nix-profile/share/man/:$MANPATH
export MANPATH=/run/current-system/sw/share/man:$MANPATH

# This is where python package libs get dropped
export PYTHONPATH=~/.nix-profile/lib/python2.7/site-packages:$PYTHONPATH

alias nsp="nix-shell --pure"

export NIXPKGS=${NIXPKGS:-$HOME/.nix-defexpr/channels/nixpkgs}

nixi () {
    nix-channel-update || true
    nix-env -f $NIXPKGS -iA pkgs.$1
    rm -f ~/.cache/dmenu_run 2>/dev/null 1>/dev/null
}
pixi () {
    nixi "pythonPackages.$1"
}
hixi () {
    nixi "haskellPackages.$1"
}

alias ncg='nix-collect-garbage -d'
pyrm () {
  nix-env -e "python2.7-$1"
}
alias nb='nix-build'
alias lsp='PAGER= nix-env -q'

tmpnix() {
    local chan="$1"
    if [ ! -e ~/.nix-defexpr/channels_root/$chan ]; then
	echo "No such channel: $chan" >&2
        return 1
    fi
    local dir=$(tempdir make)
    cp -r ~/.nix-defexpr/channels_root/$chan/* $dir
    chmod -R +w $dir
    echo $dir
}

update_nixos() {
    sudo sh $SH_CONFIG/scripts/update_nixos.sh "$@"
}

update_channels() {
    nix-channel --update
    nixlist -r >/dev/null
}

export PATH="$HOME/.nix-profile/bin:$PATH"
export NIX_PATH="$HOME/.nix-defexpr/channels:$NIX_PATH"
alias nixpkgs="cd $HOME/nixpkgs"

# Print the hash of the current nixpkgs hash installed to stdout.
current_nixpkgs() {
  local nixpkgs_link=$(readlink -f ~/.nix-defexpr/channels/nixpkgs)
  local nixpkgs_folder=$(basename $(dirname $nixpkgs_link))
  echo $nixpkgs_folder | command grep -Po '.*?\K(\w+$)'
}

# Follow the nixpkgs channel url to the latest.
latest_nixpkgs() {
  local url=http://nixos.org/channels/nixpkgs-unstable
  local res=$(curl -Ls -o /dev/null -w %{url_effective} $url)
  python -c "import re; print(re.match(r'.*?(\w+)/$', '$res').group(1))"
}

nix-channel-update() {
  if [ $(latest_nixpkgs) != $(current_nixpkgs) ]; then
    nix-channel --update
  else
    echo "Already up-to-date at $(current_nixpkgs)"
  fi
}

alias ncg='nix-collect-garbage -d'
pyrm() {
  nix-env -e "python2.7-$1"
}
alias nb='nix-build'
alias lsp='PAGER= nix-env -q'
nixrm() {
    lsp | egrep $1 | xargs nix-env -e
}
alias nse='nix-shell --pure -A env'

# Print all of the result symlinks that are floating around on the hard drive.
nix_result_links() {
  nix-store --gc --print-roots | awk '{print $1}' | grep result
}

rm_nix_result_links() {
  nix_result_links | xargs rm
}

export NIX_NODE_PACKAGES=$HOME/workspace/nix/nix-node-packages

findnix () {
    if [[ $# < 1 ]]; then
        echo "Need at least one argument." >&2
        return 1
    fi
    command="grep -r '$1' $NIXPKGS"
    shift
    for arg in $@; do
        command+=" | grep '$arg'"
    done
    eval "$command"
}