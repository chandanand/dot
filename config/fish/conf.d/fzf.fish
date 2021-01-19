# Set up the default, mnemonic key bindings unless the user has chosen to customize them
if not set --query fzf_fish_custom_keybindings
    # Because of scoping rules, to capture the shell variables exactly as they are, we must read
    # them before even executing __fzf_search_shell_variables. We use psub to store the
    # variables' info in temporary files and pass in the filenames as arguments.
    set --local search_vars_cmd '__fzf_search_shell_variables (set --show | psub) (set --names | psub)'

    # set up the same key bindings for insert mode if using fish_vi_key_bindings
    bind --mode insert \cf '__fzf_search_current_dir'
    bind --mode insert \cr '__fzf_search_history'
    bind --mode insert \cv $search_vars_cmd
    bind --mode insert \e\cl '__fzf_search_git_log'
    bind --mode insert \e\cs '__fzf_search_git_status'
end

# If FZF_DEFAULT_OPTS is not set, then set some sane defaults. This also affects fzf outside of this plugin.
# See https://github.com/junegunn/fzf#environment-variables
if not set --query FZF_DEFAULT_OPTS
    # cycle allows jumping between the top and bottom most results, making scrolling easier
    # reverse layout lists results from top to bottom, which is mimicks the familiar layout of git log, history, and env
    # border makes clear where the fzf window ends
    # height 90% leaves space to see the command line and some terminal scrollback, maintaining context of work
    # preview-window wrap wraps long lines in the preview window, making reading easier
    set --export FZF_DEFAULT_OPTS '--cycle --layout=reverse --border --height 90% --preview-window=wrap'
end

function _fzf_uninstall --on-event fzf_uninstall
    # Not going to erase FZF_DEFAULT_OPTS because too hard to tell if it was set by the user or by this plugin
    if not set --query fzf_fish_custom_keybindings
        bind --erase --all \cf
        bind --erase --all \cr
        bind --erase --all \cv
        bind --erase --all \e\cl
        bind --erase --all \e\cs

        set_color --italics cyan
        echo "fzf.fish key bindings removed"
        set_color normal
    end
    functions --erase _fzf_uninstall
end
