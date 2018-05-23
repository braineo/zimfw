
# Setup fzf
# ---------
if [[ ! "$PATH" == *${ZIM_HOME}/modules/fzf/external/bin* ]]; then
  export PATH="$PATH:${ZIM_HOME}/modules/fzf/external/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${ZIM_HOME}/modules/fzf/external/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "${ZIM_HOME}/modules/fzf/external/shell/key-bindings.zsh"

_gen_fzf_default_opts() {

    local color00='#1f2022'
    local color01='#282828'
    local color02='#444155'
    local color03='#585858'
    local color04='#b8b8b8'
    local color05='#a3a3a3'
    local color06='#e8e8e8'
    local color07='#f8f8f8'
    local color08='#f2241f'
    local color09='#ffa500'
    local color0A='#b1951d'
    local color0B='#67b11d'
    local color0C='#2d9574'
    local color0D='#4f97d7'
    local color0E='#a31db1'
    local color0F='#b03060'

    export FZF_DEFAULT_OPTS="
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"
    export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
   find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
      sed s/^..//) 2> /dev/null'
    export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
    export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
    export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
}

_gen_fzf_default_opts


