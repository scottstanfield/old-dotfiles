alias m="less"

# Make less the default pager, and specify some useful defaults.
# export LESS='XFR'

less_options=(
    --quit-if-one-screen     # If the entire text fits on one screen, just show it and quit. (like cat)
    --no-init                # Do not clear the screen first.
    --ignore-case            # Like "smartcase" in Vim: ignore case unless the search pattern is mixed.

    --chop-long-lines        # Do not automatically wrap long lines.
    --RAW-CONTROL-CHARS      # Allow ANSI colour escapes, but no other escapes.
    --quiet                  # No bell when trying to scroll past the end of the buffer.
    --dumb                   # Do not complain when we are on a dumb terminal.
);
export LESS="${less_options[*]}";
unset less_options;
export PAGER='less';

