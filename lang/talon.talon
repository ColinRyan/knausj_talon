code.language: talon
-
call insert: 
	insert('insert("")')
	edit.left()
	edit.left()
	

call key:
	insert('key()')
	edit.left()

call control key:
	insert('key(ctrl-)')
	edit.left()

call control shift key:
	insert('key(ctrl-shift-)')
	edit.left()

call control alt key:
	insert('key(ctrl-alt-)')
	edit.left()

call alt key:
	insert('key(alt-)')
	edit.left()

call alt shift key:
	insert('key(alt-shift-)')
	edit.left()

call action:
	insert("action()")
	edit.left()

os win:
	insert("os: windows")
	
os mac:
	insert("os: mac")
	
os lunix:
	insert("os: linux")
	
app:
	insert("app: ")
	
tags:
	insert("tags: ")

user:
	insert("user.")
	
comment: 
	edit.line_start()
	insert("#")
