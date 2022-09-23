# BASH PROMPT

_prompt() {
    readonly GIT_BRANCH_SYMBOL='⎇ '
    readonly GIT_BRANCH_NORMAL_SYMBOL='✓'
    readonly GIT_BRANCH_CHANGED_SYMBOL='✘'
    readonly GIT_STASH_SYMBOL="@"
    readonly GIT_PUSH_SYMBOL='↑'
    readonly GIT_PULL_SYMBOL='↓'
    
    _git_branch_info() {

        local branch="$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --always 2>/dev/null)"
        [ -n "$branch" ] || return

        local marks=" $GIT_BRANCH_NORMAL_SYMBOL"
        
        # Check if branch is modified.
        [ -n "$(git status --porcelain)" ] && marks=" $GIT_BRANCH_CHANGED_SYMBOL"

        # Compute how many commits local branch is ahead/behind of remote branch.
        local stat="$(git status --porcelain --branch | grep '^##' | grep -o '\[.\+\]$')"
        local aheadN="$(echo $stat | grep -o 'ahead \d\+' | grep -o '\d\+')"
        local behindN="$(echo $stat | grep -o 'behind \d\+' | grep -o '\d\+')"
        [ -n "$aheadN" ] && marks+=" $GIT_PUSH_SYMBOL$aheadN"
        [ -n "$behindN" ] && marks+=" $GIT_PULL_SYMBOL$behindN"

        # Print the git branch segment without a trailing newline
        printf " $GIT_BRANCH_SYMBOL $branch$marks "
    }

    _virtualenv () {
        # Python venv info
        if test -z "$VIRTUAL_ENV" ; then
            printf ""
        else
            printf "(`basename \"$VIRTUAL_ENV\"`) "
        fi
    }

    _status_color() {
        # Git status info
        if [ -n "$(git status --porcelain)" ]; then 
            printf "$RED"
        else
            printf "$YELLOW"
        fi
    }

    ps1() {
        PS1="\[$WHITE_BOLD\]╭── \[$GOLD_BOLD\]\u\[$WHITE\]" # User
        PS1+=" in \[$GREEN_BOLD\]\w " # Directory

        if git rev-parse --git-dir > /dev/null 2>&1; then
            # Git branch info
            PS1+="\[$WHITE\]\$(_status_color){$(_git_branch_info)}\[$NORMAL\]"
        fi
        
        PS1+="\n\[$NORMAL\]\[$WHITE_BOLD\]╰── $(_virtualenv)$\[$NORMAL\] "
    }

    PROMPT_COMMAND=ps1
}

_prompt
unset _prompt
