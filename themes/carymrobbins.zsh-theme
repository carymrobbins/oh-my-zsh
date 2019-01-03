local retStatus="%(?:%{$fg_bold[green]%}✔:%{$fg_bold[red]%}✘%s)"

PROMPT_DEFAULT='%{$fg[blue]%}${(r:$COLUMNS::─:)}%{$reset_color%}
${retStatus}%{$fg_bold[green]%} %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(venv_prompt_info)$(stack_prompt_info)$(git_prompt_info)%{$fg_bold[blue]%}%{$reset_color%}%{$fg[magenta]%}%% %{$reset_color%}'

PROMPT=$PROMPT_DEFAULT

PROMPT_SIMPLE='
%{$fg[magenta]%}%% %{$reset_color%}'

alias prs='PROMPT=$PROMPT_SIMPLE'
alias prd='PROMPT=$PROMPT_DEFAULT'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[yellow]%} %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[yellow]%}⨳%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%} "

ZSH_THEME_VENV_SYMBOL=
#ZSH_THEME_VENV_SYMBOL=🐍
#ZSH_THEME_VENV_SYMBOL=
#ZSH_THEME_VENV_SYMBOL=
ZSH_THEME_VENV_PROMPT_PREFIX="%{$reset_color%}%{$fg[blue]%}$ZSH_THEME_VENV_SYMBOL "
ZSH_THEME_VENV_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_STACK_SYMBOL=
ZSH_THEME_STACK_PROMPT_PREFIX="%{$reset_color%}%{$fg[magenta]%}$ZSH_THEME_STACK_SYMBOL "
ZSH_THEME_STACK_PROMPT_SUFFIX="%{$reset_color%}"
