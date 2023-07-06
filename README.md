# Introduction
mSL IRC bot build in 2009. The code is bad, repetitive and nasty. However, its the first big project I ever did as a kid and the first language I ever wrote anything in.
So to me this project has a lot of sentimental value. If you want to have a good laugh check out some of the code. Functions/Alias, I never heard of them!


# Description
Description below taken from the hawkee entry I wrote at the time: http://hawkee.com/snippet/9721/

It basicly does channel management. With some extra's. You can register channels to people, they will be owner to the channel and are able to add users with diffrent levels (100, 200, 300, 400) Peon, Op, Master, co-owner. It also has a god mode so owners of the bot can do whatever they want to all registered channels. A few games are inserted and a helpserv if you run some project like we did by then, there might be some bugs because it is made on the irc.onlinegamesnet.net IRC server and it worked there. It uses RAW and /whois to find out what Authserv/Nickserv account you are logged in to.

## Install
When you wanna use this bot, write //run $mircdir in your mIRC and create a .ini file: admins.ini after that put this insite:
```
[admins]
yourname=youname
yourname=1000
[1000]
yourname=yourname
```
After that write on IRC $addadmin yourname 1000 and then it should be done. The bot works with Authserv, if your IRC server doesn't have authserv idk if it is gonna work, it did with nickserv on a few servers as far as I know.

# Commands
Probably I miss some but you can find them in the help files or the $help, !help and @help on IRC.

Users
Readusers
a 
ma 
peons
ops
masters
co-owners
owners
adduser
addpeon
addop
addmaster
addcoowner
addowner
deluser 
clvl 
resync
up
down
Addadmin 
deladmin 
adminclvl
do
god
nick 
reg
unreg 
say 
emote 
part 
join 
slap 
givepoints 
oa 
set - giveops,givevoice, enfops, enfvoice,  setters, autovoice, userscript, protect, uset
bans
savebans
rban
uba
delbanall
addban
delban
kickban
kb
uset
joininfo
partinfo
remjoininfo
partjoininfo
setinfo
reminfo
op
deop
voice
devoice
dva
va
opa
dpa
games
oaccess
channel
fun
setin
rr
sr
r
ln 
ht
number
dance
hug
test
invite
uptime
calc
throw
ping
pong
spam
banana
porn
flag
appel
tomaaas
littlehero
berend
wut
wtf
fail
hack
points
