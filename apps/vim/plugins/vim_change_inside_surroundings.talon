tag: user.vim_change_inside_surroundings
and not tag: user.vim_terminal
-

# XXX - i'm using 'this' right now to avoid conflicting with the support in vim.py
(change inside this|shimmer):
    user.vim_command_mode(":ChangeInsideSurrounding\n")
(change around this|shammer):
    user.vim_command_mode(":ChangeAroundSurrounding\n")
