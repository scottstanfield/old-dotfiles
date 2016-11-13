# Symbols
: ${is_a_git_repo_symbol:='❤'}
: ${has_untracked_files_symbol:='∿'}
: ${has_adds_symbol:='+'}
: ${has_deletions_symbol:='-'}
: ${has_deletions_cached_symbol:='✖'}
: ${has_modifications_symbol:='✎'}
: ${has_modifications_cached_symbol:='☲'}
: ${ready_to_commit_symbol:='→'}
: ${is_on_a_tag_symbol:='⌫'}
: ${needs_to_merge_symbol:='ᄉ'}
: ${has_upstream_symbol:='⇅'}
: ${detached_symbol:='⚯ '}
: ${can_fast_forward_symbol:='»'}
: ${has_diverged_symbol:='Ⴤ'}
: ${rebase_tracking_branch_symbol:='↶'}
: ${merge_tracking_branch_symbol:='^'}
: ${should_push_symbol:='↑'}
: ${has_stashes_symbol:='★'}

# Flags
: ${display_has_upstream:=false}
: ${display_tag:=false}
: ${display_tag_name:=true}
: ${two_lines:=true}
: ${finally:=''}
: ${use_color_off:=false}


#load colors
autoload colors && colors
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
    eval $COLOR='%{$fg_no_bold[${(L)COLOR}]%}'  #wrap colours between %{ %} to avoid weird gaps in autocomplete
    eval BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done
eval RESET='%{$reset_color%}'

on=$WHITE
off=$WHITE
red=$RED
green=$GREEN
yellow=$YELLOW
violet=$CYAN
branch_color=$BLUE
reset=$RESET


function prompt_tail {
    local B=''
	if [[ `tput cols` -gt 60 ]]; then
		B=$'∙'
	else
		B=$'\n∙'
	fi
	echo $B
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '%U'`basename $VIRTUAL_ENV`'%u'
}

PROMPT='$green%m %{$fg_bold[green]%}%4~%{$fg_bold[red]%}%(?.. [%?]) $(prompt_tail) '
RPROMPT='$(build_prompt)$(virtualenv_info)'
#RPROMPT='%{$reset_color%}{$fg_bold[white]%} %n@%m%{$reset_color%}'

#ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}- on %{$fg_bold[magenta]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%} branch %{$fg_bold[green]%}✔"
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%} branch %{$fg_bold[yellow]%}✗"
