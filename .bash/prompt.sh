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

    _status_color() {
        if [ -n "$(git status --porcelain)" ]; then 
            printf "$RED"
        else
            printf "$YELLOW"
        fi
    }

    ps1() {
        PS1="\[$BOLD_WHITE\]╭── \[$BOLD_RED\]\u\[$WHITE\]" # User
        PS1+=" in \[$BOLD_GREEN\]\w " # Directory

        if git rev-parse --git-dir > /dev/null 2>&1; then
            PS1+="\[$BOLD_WHITE\]\$(_status_color){$(_git_branch_info)}" # Git Branch Info.
        fi
        
        PS1+="\n\[$BG_EXIT\]\[$BOLD_WHITE\]╰── $\[$NORMAL\] "
    }
    
    PROMPT_COMMAND=ps1
}

_prompt
unset _prompt
