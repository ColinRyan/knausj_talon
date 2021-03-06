# NOTE: these are command line commands, not shell-specific bindings
# see shell.talon for shell-specific keybindings
os: linux
mode: user.terminal
mode: command
and tag: terminal
-
list file: "ls "
list here: "ls\n"
list long: "ls -al "
list long here: "ls -al\n"
lydia: "ls -d */\n"
# TODO - somehow make this scriptable to print anything
edit latest: "edit $(ls -Art | tail -n1)\n"
latest: "ls -Art | tail -n1\n"
file latest: "$(ls -Art | tail -n1)"
watch latest: "vlc $(ls -Art | tail -n1)"


# directory and files
pivot: "cd "
pivot <user.paths>:
    insert("cd {paths}\n")
    insert("ls\n")
pivot up: "cd ../\n"
(parent|up) dir: "../"
traverse: "../"
pivot home: "cd\n"
pivot last: "cd -\n"

make (dur|dear|dir|directory): "mkdir "
make (dur|dear|dir|directory) <user.text>: "mkdir {text}"
remove (dur|dear|dir|directory): "rmdir "
remove (dur|dear|dir|directory) <user.text>: "rmdir {text}"
remove file: "rm "

# tree
tree: "tree -L 2\n"
tree long: "tree -L 2 -p\n"
tree all: "tree -L 2 -a\n"
tree folders: "tree -L 2 -d\n"


temp (dur|dear|dir|directory): "cd /tmp\n"
pop (dur|dear|dir|directory): "popd\n"

# permissions
make executable: "chmod +x "
change ownership: "chown "

# links
sim link: "ln -s "
sim link force: "ln -sf "
hard link: "ln "

# finds
list sim links: "find . -maxdepth 1 -type l  -ls\n"
list (directories|folders): "find . -maxdepth 1 -type d  -ls\n"
list files: "find . -maxdepth 1 -type f  -ls\n"

touch: "touch "
file: "file "
# file management
move file: "mv "
copy file: "cp "

# file viewing
less: "less "
now less [that]:
    edit.up()
    insert("| less\n")
show me <user.text>: "cat {text}"
show me: "cat "

clear [screen|page]: "clear\n"

# find
find file: "find . -name "
fuzzy find file:
    insert("find . -name \"**\"")
    key("left")
    key("left")

# grepping

rip: "rg -i "
rip around: "rg -B2 -A2 -i "
rip (exact|precise): "rg "
now rip:
    edit.up()
    insert("| rg -i ")

# even though rip is arguably better, we still want grep for remote terminals,
# etc
grep: "grep -i "
grep around: "grep -B2 -A2 -i "
now grep:
    edit.up()
    insert("| grep -i ")

# networking
net [work] (I P|eye pee): "ip addr\n"
net [work] (route|routes): "ip route\n"
net stat: "netstat -ant\n"
net cat: "nc -vv "
net cat listener: "nc -v -l -p "
show hosts file: "cat /etc/hosts\n"
edit hosts file: "sudo vi /etc/hosts\n"
tcp dump: "tcpdump "

generate see tags: "ctags --recurse *\n"
generate see scope database:
    insert('find . -name "*.c"')
    insert(' -o -name "*.cpp"')
    insert(' -o -name "*.h"')
    insert(' -o -name "*.hpp"')
    insert(' -o -name "*.py"')
    insert(' -o -name "*.s"')
    insert(' -o -name "*.asm"')
    insert('> cscope.files\n')
    insert("cscope -q -R -b -i cscope.files\n")

pee grep: "pgrep "
pee kill: "pkill "
process list: "ps -ef\n"
process top: "htop\n"
locate: "locate "
head: "head "
head <number_small>: "head -n {number_small} "
(where am I|print working directory): "pwd\n"

edit here: insert("edit .\n")

#edit <user.text>$:
#    insert("edit {text}")

edit:
    insert("edit ")
edit read me:
    insert("edit README.md\n")

# XXX - ~/.edit/sessions/<tab>
edit session:
    insert("edit -S ")

lazy edit:
    insert("edit ")
    insert("$(find . -not -path '*/\\.git/*' -name \"**\")")
    key("left")
    key("left")
    key("left")

lazy edit <user.text>:
    insert("edit ")
    insert("$(find . -not -path '*/\\.git/*' -name \"*{text}*\")\n")

find <user.text> inside (python|pie) files:
    insert('$(find . -name \"*.py\") | xargs rg -i "{text}"\n')

find <user.text> inside (python|pie) files less:
    insert('$(find . -name \"*.py\") | xargs rg -i "{text}\" | less\n')

man page: "man "
so do: "sudo "
d message: "dmesg"
system log: "journalctl -k --no-pager --no-hostname\n"
disk usage: "df -h\n"
sis cuddle: "sysctl "
sis cuddle set: "sysctl -w "

# extraction
tar ball: "tar -"
tar ball extract [zip]: "tar -xvaf "
# tar ball extract bee zip: "tar -xvjf "
(un zip|extract zip): "unzip "

curl: "curl "
double you get: "wget "
download clipboard:
    insert("wget ")
    edit.paste()
    key(enter)

# because talent doesn't seem to like me saying ./
run script: "./"
run again:
    insert("./")
    key(up enter)

# bash convenience stuff
history: "history\n"
for file loop:
    insert("for FILE in $(ls \"*\"); do $FILE; done")

net man log: "journalctl -u NetworkManager --no-pager --lines 100\n"

# ssh
secure shell: "ssh "
secure shell <user.text>: "ssh {text}\n"
secure copy [<user.text>]:
    insert("scp -r ")
    insert(text or "")
show authorized keys: "vi ~/.ssh/authorized_keys\n"
show pub keys: "cat ~/.ssh/*.pub\n"
edit authorized keys: "vi ~/.ssh/authorized_keys\n"
go secure shell config: "cd ~/.ssh\n"
terminate session:
    key(enter ~ .)

# process management
run top: "htop\n"
pee kill <user.text>: "pkill {text}"
kill <number>: "kill -9 {number}"
kill: "kill -9 "
reboot system: "sudo reboot -h now"

# hardware
list memory: "lshw -short -C memory"
list processor: "lscpu\n"
list pee bus: "lspci\n"
list yew bus: "lsusb\n"

# XXX - from the old standard.talon file
# unsorted
zed s h: "zsh"
diff: "diff "

# XXX - make run commands part of something else?
run vim: "vim "
run make: "make\n"
run see make: "cmake "

(redirect errors|errors to standard out): "2>&1 "
ignore errors: "2>/dev/null"

# XXX
collide: "sha256sum "

###
# Python
###

new (pie|python) (env|environment): "python -m venv env"
python module: "python -m "
(activate|enter python environment): "source env/bin/activate\n"
(deactivate|leave python environment): "deactivate\n"


###
# Screen recording
###

record screen: insert("recordmydesktop")

###
# X11 stuff
###

screen dimensions: "xdpyinfo | grep dimensions\n"
screen resolution: "xdpyinfo | awk '/dimensions/{{print $2}}'\n"
