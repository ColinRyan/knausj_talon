# https://timewarrior.net
os: linux
tag: terminal
-

(time warrior|time): "timew\n"
# Just set a generic timer
(time warrior|time) start now: "timew start\n"
(time warrior|time) start <phrase>: "timew start {phrase}"
(time warrior|time) start <number_small> minutes ago: "timew start {number_small}mins ago "
(time warrior|time) start <number_small> hours ago: "timew start {number_small}hours ago "
(time warrior|time) start: "timew start "
(time warrior|time) stop now: "timew stop\n"
(time warrior|time) stop: "timew stop "
(time warrior|time) stop <number_small> minutes ago: "timew stop {number_small}mins ago "
(time warrior|time) stop <number_small> hours ago: "timew stop {number_small}hours ago "
(time warrior|time) cancel: "timew cancel\n"
(time warrior|time) summary: "timew summary\n"
(time warrior|time) tags: "timew tags\n"

(time warrior|time) extensions: "timew extensions\n"
