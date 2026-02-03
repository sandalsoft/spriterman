# Spriterman shell aliases and functions
# Source this file in ~/.bashrc: source /path/to/spriterman/config/aliases.sh

# Default npm command (can be overridden by user)
npmCommand="${npmCommand:-npm}"

# ------------------------------------------------------------------------------
# Claude/Codex Shortcuts
# ------------------------------------------------------------------------------

# Git commit with Codex
alias gcy='git commit -y'

# Claude Code launcher (co = codex)
alias co='claude'

# Claude shortcut
alias cl='claude'

# Claude with model selection
alias clm='claude --model'

# ------------------------------------------------------------------------------
# Git Shortcuts
# ------------------------------------------------------------------------------

# Git branch
alias gb='git branch'

# Git remote add origin
function grao() {
    git remote add origin "$1"
}

# Git remote set-url origin
function grso() {
    git remote set-url origin "$1"
}

# Git status
alias g='git status'

# Git diff
alias gd='git diff'

# Git log (one line format)
alias lg='git log --oneline'

# Git log (verbose)
alias gl='git log'

# Git push
alias p='git push'

# Git push with upstream tracking
alias pu='git push -u origin HEAD'

# Git pull
alias gpl='git pull'

# Git checkout
function gco() {
    git checkout "$@"
}

# Git checkout new branch
function gcob() {
    git checkout -b "$1"
}

# Git add
function ga() {
    if [ $# -eq 0 ]; then
        git add -A
    else
        git add "$@"
    fi
}

# Git commit with message
function gcm() {
    git commit -m "$*"
}

# Git add all and commit
function gac() {
    git add -A && git commit -m "$*"
}

# Git stash
alias gs='git stash'

# Git stash pop
alias gsp='git stash pop'

# Git fetch
alias gf='git fetch'

# Git rebase
function gr() {
    git rebase "$@"
}

# Git merge
function gm() {
    git merge "$@"
}

# Git cherry-pick
function gcp() {
    git cherry-pick "$@"
}

# Git reset
function greset() {
    git reset "$@"
}

# Git clean
alias gclean='git clean -fd'

# ------------------------------------------------------------------------------
# Bun Shortcuts
# ------------------------------------------------------------------------------

# Bun run dev
alias brd='bun run dev'

# Bun run build
alias brb='bun run build'

# Bun test
alias bt='bun test'

# Bun install
alias bi='bun install'

# Bun add
function ba() {
    bun add "$@"
}

# Bun add dev dependency
function bad() {
    bun add -d "$@"
}

# ------------------------------------------------------------------------------
# NPM Shortcuts (uses $npmCommand variable, defaults to npm)
# ------------------------------------------------------------------------------

# NPM run dev
alias nrd='$npmCommand run dev'

# NPM run build
alias nrb='$npmCommand run build'

# NPM start
alias ns='$npmCommand start'

# NPM test
alias nt='$npmCommand test'

# NPM install
alias ni='$npmCommand install'

# NPM install (save)
function nis() {
    $npmCommand install --save "$@"
}

# NPM install (save-dev)
function nid() {
    $npmCommand install --save-dev "$@"
}

# NPM run (arbitrary script)
function nr() {
    $npmCommand run "$@"
}

# NPM update
alias nu='$npmCommand update'

# NPM outdated
alias nout='$npmCommand outdated'

# NPM list
alias nls='$npmCommand list --depth=0'

# NPM audit
alias naudit='$npmCommand audit'

# NPM audit fix
alias nfix='$npmCommand audit fix'

# ------------------------------------------------------------------------------
# Utility Functions
# ------------------------------------------------------------------------------

# Create directory and cd into it
function mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Find files by name
function ff() {
    find . -name "*$1*"
}

# Quick grep
function qg() {
    grep -r "$1" .
}

# Extract various archive formats
function extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"    ;;
            *.tar.gz)    tar xzf "$1"    ;;
            *.bz2)       bunzip2 "$1"    ;;
            *.rar)       unrar x "$1"    ;;
            *.gz)        gunzip "$1"     ;;
            *.tar)       tar xf "$1"     ;;
            *.tbz2)      tar xjf "$1"    ;;
            *.tgz)       tar xzf "$1"    ;;
            *.zip)       unzip "$1"      ;;
            *.Z)         uncompress "$1" ;;
            *.7z)        7z x "$1"       ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
