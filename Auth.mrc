RAW 330:*is logged in as*: {
  writeini dafauth.ini nicks $2 $3
  writeini dafauth.ini auths $3 $2 
}
RAW 354:*: {
  writeini dafauth.ini nicks $3 $5
  writeini dafauth.ini auths $5 $3
  }
}
on *:NICK: { 
  whois $newnick
  remini dafauth.ini nicks $nick
}
on *:TEXT:$auth:#: {
  whois $nick
  notice $nick done
  set %a [
  set %b ]
  msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 0 $+ %b $1 $+ :Auth user $2-
}
on *:TEXT:$authchan:#: {
  who $chan (%nacf)
  set %a [
  set %b ]
  msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 0 $+ %b $1 $+ :Auth all users $2-
}
on *:QUIT: {
  remini dafauth.ini nicks $nick
}
