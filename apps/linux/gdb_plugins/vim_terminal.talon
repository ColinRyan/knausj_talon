#tag: vim
tag: gdb
-

###
# VIM terminal GDB convenience
#
# These only work if you run GDB from inside a vim terminal and you're using
# vim.py automatic mode switching support
#
# It when you're running the terminal for a long time, the line numbers become
# so large they are hard to say, so I support some commands to use relative
# numbers. There is support in vim.talon for swapping between absolute and
# relative numbers relatively easily
###

## SAME LINE COMMANDS

# Assumes you are already on a line with hex addresses
copy <user.ordinals> (hex value|address):
    insert(":call search(\"0x\", 'c', line('.'))\n")
    insert("{ordinals-1}n")
    insert("yw")
    insert(":set nohls\n")

(hexdump|matrix) <user.ordinals> (hex value|address):
    insert(":call search(\"0x\", 'c', line('.'))\n")
    insert("{ordinals-1}n")
    insert("yw")
    insert(":set nohls\n")
    insert("i")
    # XXX - need to make this tweakable
    insert("x/10gx ")
    edit.paste()
    key(enter)

go <user.ordinals> (hex value|address):
    insert(":call search(\"0x\", 'c', line('.'))\n")
    insert("{ordinals-1}n")
    insert(":set nohls\n")

(hexdump|matrix) [this] address:
    insert("yiw")
    insert("i")
    insert("x/10gx ")
    edit.paste()
    key(enter)

### LINE JUMPING COMMANDS

# relative
copy line <number> (hex value|address):
    user.vim_normal_mode_exterm("{number}k\n")
    key('0')
    insert(":call search(\"0x\", 'c', line('.'))\n")
    insert("yw")
    insert(":set nohls\n")

# copy and paste the first hex value from the specified relative line
# relative
glitter <number>:
    user.vim_normal_mode_exterm("{number}k")
    key('0')
    insert(":call search(\"0x\", 'c', line('.'))\n")
    insert("yw")
    insert(":set nohls\n")
    user.vim_set_insert_mode()
    edit.paste()


# copy and paste the Nth hex value from the specified relative line
glitter <number> <user.ordinals>$:
    user.vim_normal_mode_exterm("{number}k")
    key('0')
    # set the search pattern for 'n' usage
    insert("/\c0x\n")
    # do the actual search to include results under the cursor
    insert(":call search(\"0x\", 'c', line('.'))\n")
    # use the ordinal to count the earlier search pattern. we minus 2 because
    # we are sitting on the first one already. this will break if someone says
    # first :|
    insert("{ordinals-2}n")
    insert("ye")
    insert(":set nohls\n")
    user.vim_set_insert_mode()
    edit.paste()

## absolute
(hexdump|matrix) line <number>$:
    user.vim_normal_mode_exterm(":{number}\n")
    insert("^")
    insert(":call search(\"0x\", 'c', line('.'))\n")
    insert("yiw")
    insert(":set nohls\n")
    insert("i")
    sleep(100ms)
    # XXX - need to make this tweakable
    insert("x/100gx ")
    edit.paste()
    sleep(100ms)
    key(enter)

# relative
(hexdump|matrix) [relative] up [line] <number>$:
    user.vim_normal_mode_exterm("{number+1}k\n")
    insert("^")
    insert(":call search(\"0x\", 'c', line('.'))\n")
    insert("yiw")
    insert(":set nohls\n")
    insert("i")
    sleep(100ms)
    # XXX - need to make this tweakable
    insert("x/100gx ")
    edit.paste()
    sleep(100ms)
    key(enter)

# relative
(hexdump|matrix) [relative] down [line] <number>$:
    user.vim_normal_mode_exterm("{number+1}j\n")
    insert("^")
    insert(":call search(\"0x\", 'c', line('.'))\n")
    insert("yiw")
    insert(":set nohls\n")
    insert("i")
    sleep(100ms)
    # XXX - need to make this tweakable
    insert("x/100gx ")
    edit.paste()
    sleep(100ms)
    key(enter)

# absolute
(hexdump|matrix) line <number> <user.ordinals>$:
    user.vim_normal_mode_exterm(":{number}\n")
    insert("^")
    insert(":call search(\"0x\", 'c', line('.'))\n")
    insert("{ordinals-1}n")
    insert("yw")
    insert(":set nohls\n")
    insert("i")
    sleep(200ms)
    # XXX - need to make this tweakable
    insert("x/100gx ")
    edit.paste()
    sleep(100ms)
    key(enter)

# relative
(hexdump|matrix) [relative] down [line] <number> <user.ordinals>$:
    user.vim_normal_mode_exterm("{number+1}j\n")
    insert("^")
    insert(":call search(\"0x\", 'c', line('.'))\n")
    insert("yiw")
    insert("{ordinals-1}n")
    insert(":set nohls\n")
    insert("i")
    sleep(100ms)
    # XXX - need to make this tweakable
    insert("x/100gx ")
    edit.paste()
    sleep(100ms)
    key(enter)

# for use with relative number lines
(hexdump|matrix) [relative] up [line] <number> <user.ordinals>$:
    user.vim_normal_mode_exterm("{number+1}k\n")
    insert("^")
    insert(":call search(\"0x\", 'c', line('.'))\n")
    insert("yiw")
    insert("{ordinals-1}n")
    insert(":set nohls\n")
    insert("i")
    sleep(100ms)
    # XXX - need to make this tweakable
    insert("x/100gx ")
    edit.paste()
    sleep(100ms)
    key(enter)
