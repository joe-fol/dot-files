#Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(git
	zsh-autosuggestions
	zsh-syntax-highlighting
    vi-mode
)

source $ZSH/oh-my-zsh.sh

# zsh 
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

# misc
export PATH="/usr/share/code/bin:$PATH"
export PATH="/home/joe/.local/bin:$PATH"
export EDITOR="vim"

## docker alias
alias dps="docker ps"
alias drm="docker rm"
alias drmf="docker rm -f $(docker ps -a -q)"
alias dkill="docker kill"
alias dpsa="docker ps -a"
alias dlog="docker logs"
## Webcam setting
alias camconfig="v4l2-ctl --list-devices"
alias webcam="v4l2-ctl -d /dev/video0 --set-ctrl=power_line_frequency=1"

# This sets NVM when .nvmrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
local nvmrc_path="$(nvm_find_nvmrc)"

if [ -n "$nvmrc_path" ]; then
local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
echo "Reverting to nvm default version"
nvm use default
fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

## backward-delete-word

my-backward-delete-word() {
    local WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>:,"'"'"
    zle backward-delete-word
}
zle -N my-backward-delete-word
bindkey '^W' my-backward-delete-word

## lazy*
alias lzd='docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v /yourpath/config:/.config/jesseduffield/lazydocker lazyteam/lazydocker'
alias lzg='lazygit'

## Go path
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

## exa
alias ll='exa -l --icons'
alias lt='exa --tree'

## rip
alias rip='rip -i'

## Bichard
alias e2eCode='aws-vault exec bichard7-shared-e2e-test -- ./scripts/get_2fa_code_from_aws.sh'
alias 2fa='./scripts/get_2fa_code_from_logs.sh | xclip -selection clipboard'
alias bichMessage='aws-vault exec qsolution-production -- aws s3 ls s3://bichard-7-production-internal-incoming-messages/2022/11 --recursive | wc -l'
alias nextBuild='npm run build && npm run start'
alias qsol='aws-vault login qsolution-production'
alias bichShared='aws-vault login bichard7-shared-login'
alias e2eVpn='WORKSPACE=e2e-test aws-vault exec bichard7-shared-e2e-test -- make get-vpn-config' 
alias prodVpn='WORKSPACE=production aws-vault exec qsolution-production -- make get-vpn-config'
alias preVpn='WORKSPACE=preprod aws-vault exec qsolution-pre-prod -- make get-vpn-config'
alias elevateVpn='aws-vault exec bichard7-shared -- aws codebuild start-build --project-name elevate-prod-access-to-vpn-users'

### Bichard repos
alias bnext='cd ~/bichard/bichard7-next'
alias bui='cd ~/bichard/bichard7-next-ui'
alias bcore='cd ~/bichard/bichard7-next-core'
alias bdata='cd ~/bichard/bichard7-next-data'
alias binfra='cd ~/bichard/bichard7-next-infrastructure'
alias bshared='cd ~/bichard/bichard7-next-shared-infrastructure'
alias buser='cd ~/bichard/bichard7-next-user-service'
alias baudit='cd ~/bichard/bichard7-next-audit-logging'
alias btest='cd ~/bichard/bichard7-next-tests'
alias bdock='cd ~/bichard/bichard7-next-infrastructure-docker-images'
## bat
alias cat='bat'

## git
alias stash='git stash'
alias pop='git stash pop'

## dooit
alias doit='cd ~/.local/bin && ./dooit'

## datagrip
alias unlockDb='cd ~/.var/app/com.jetbrains.DataGrip/config/JetBrains/DataGrip2023.2/ && rm .lock'

## fzf
source /usr/share/doc/fzf/examples/completion.zsh
source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## starship prompt
eval "$(starship init zsh)"

