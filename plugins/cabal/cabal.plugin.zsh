function cabal_sandbox_info() {
    cabal_files=(*.cabal(N))
    if [ $#cabal_files -gt 0 ]; then
        if [ -f cabal.sandbox.config ]; then
            echo "%{$fg[green]%}sandboxed%{$reset_color%}"
        else
            echo "%{$fg[red]%}not sandboxed%{$reset_color%}"
        fi
    fi
}

function _cabal_commands() {
    # Ensure cabal exists.
    command -v cabal > /dev/null || return
    local ret=1 state
    _arguments ':subcommand:->subcommand' && ret=0

    case $state in
      subcommand)
        subcommands=(
            "--help:Show help text."
            "--version:Print version information."
        )
        for x in $(cabal --list | grep '^[a-z]'); do
            description=$(
                # Grep for command.
                cabal --help | grep "^  $x" | \
                # Escape quotes.
                sed "s/'/\\\\'/g" | sed "s/\"/\\\\\"/g" | \
                # Split on contiguous space and slice from 2nd item onwards.
                xargs | cut -d ' ' -f 2-)
            subcommands+=("$x:$description")
        done
        for x in $(cabal --list | grep '^\-\-'); do
            description=$(
                # Grep for flag, escaping flag dashes.
                cabal --help | grep "^    $(echo $x | sed 's/-/\\-/g')" | \
                # Split on contiguous space and slice from 2nd item onwards.
                xargs | cut -d ' ' -f 2-)
            if [ "$description" != "" ]; then
                subcommands+=("$x:$description")
            fi
        done
        _describe -t subcommands 'cabal subcommands' subcommands && ret=0
    esac

    return ret
}

compdef _cabal_commands cabal
