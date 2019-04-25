on *:text:$reminfo *:*: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %auth2 $readini(dafauth.ini, nicks, $2)
  if (%god [ $+ [ %auth ] ] == 1) {
    remini partinfo $+ $network $+ .ini $chan %auth2
    remini setinfo $+ $network $+ .ini $chan %auth2
    Notice $nick $2 $+ 's Join/Part info Removed $+ .
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 800 $+ %b $1 $+ :Reminfo $2-
  }
  else { 
    notice $nick You need to have god mode enebled. 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 800 $+ %b %a $+ Lack access $+ %b $1 $+ :Reminfo $2-
  }
} 
on *:text:$setinfo *:*: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %auth2 $readini(dafauth.ini, nicks, $2)
  if (%god [ $+ [ %auth ] ] == 1) {
    writeini partinfo $+ $network $+ .ini $chan %auth2 $3-
    writeini setinfo $+ $network $+ .ini $chan %auth2 $3-
    Notice $nick $2 $+ 's Join/Part info set to: $3- 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 800 $+ %b $1 $+ :Setinfo $2-
  }
  else { 
    notice $nick You need to have god mode enebled.
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 800 $+ %b %a $+ Lack access $+ %b $1 $+ :Setinfo $2-
  }
}
on *:text:$joininfo *:*: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, Uset) || %god [ $+ [ %auth ] ] == 1) {
    writeini setinfo $+ $network $+ .ini $chan %auth $2-
    Notice $nick Joininfo set to: $2- 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 0 $+ %b $1 $+ :Joininfo $2-
  }
  else { notice $nick You lack access to $chan $+ . 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 0 $+ %b %a $+ Lack access $+ %b $1 $+ :Joininfo $2-
  }
} 
on *:text:$remjoininfo:#: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, Uset) || %god [ $+ [ %auth ] ] == 1) {
    remini setinfo $+ $network $+ .ini $chan %auth
    Notice $nick Joininfo Removed $+ .
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 0 $+ %b $1 $+ :Remjoininfo $2-
  }
  else { notice $nick You lack access to $chan $+ . 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 0 $+ %b %a $+ Lack access $+ %b $1 $+ :Remjoininfo $2-
  }
} 
on *:text:$partinfo *:*: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, Uset) || %god [ $+ [ %auth ] ] == 1) {
    writeini partinfo $+ $network $+ .ini $chan %auth $2-
    Notice $nick Partinfo set to: $2- 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 0 $+ %b $1 $+ :Partinfo $2-
  }
  else { notice $nick You lack access to $chan $+ . 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 0 $+ %b %a $+ Lack access $+ %b $1 $+ :Partinfo $2-
  }
} 
on *:text:$rempartinfo:#: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, Uset) || %god [ $+ [ %auth ] ] == 1) {
    remini Partinfo $+ $network $+ .ini $chan %auth
    Notice $nick Partinfo Removed $+ .
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 0 $+ %b $1 $+ :Rempartinfo $2-
  }
  else { notice $nick You lack access to $chan $+ . 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 0 $+ %b %a $+ Lack access $+ %b $1 $+ :Rempartinfo $2-
  }
} 
on *:text:$uset:#: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, Uset) || %god [ $+ [ %auth ] ] == 1) {
    notice $nick Your JoinInfo: $readini(setinfo $+ $network $+ .ini, $chan, [ $+ [ %auth ] ]) 
    notice $nick Your PartInfo: $readini(Partinfo $+ $network $+ .ini, $chan, [ $+ [ %auth ] ]) 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 0 $+ %b $1 $+ :Uset $2-
  }
  else { notice $nick You lack access to $chan $+ . 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 0 $+ %b %a $+ Lack access $+ %b $1 $+ :Uset $2-
  }
}
on *:text:$uset *:*: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $2)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, Uset) || %god [ $+ [ %auth ] ] == 1) {
    notice $nick  $+ $2 $+ 's Joininfo: $readini(setinfo $+ $network $+ .ini, $chan, [ $+ [ %auth ] ])
    notice $nick  $+ $2 $+ 's Partinfo: $readini(Partinfo $+ $network $+ .ini, $chan, [ $+ [ %auth ] ])
    var %auth $readini(dafauth.ini, nicks, $nick)
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 0 $+ %b $1 $+ :Uset $2-
  }
  else { notice $nick You lack access to $chan $+ . 
    var %auth $readini(dafauth.ini, nicks, $nick)
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 0 $+ %b %a $+ Lack access $+ %b $1 $+ :Rempartinfo $2-
  }
}
on *:JOIN:#: {
  whois $nick
  var %a [
  var %b ] 
  set %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(setinfo $+ $network $+ .ini, $chan, [ $+ [ %auth ] ])) { 
    msg # %a $+ $Nick $+ %b $readini(setinfo $+ $network $+ .ini, $chan, [ $+ [ %auth ] ]) 
  }
}
on *:part:#: {
  whois $nick
  var %a [
  var %b ] 
  set %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(partinfo $+ $network $+ .ini, $chan, [ $+ [ %auth ] ])) { 
    msg # %a $+ $Nick $+ %b $readini(partinfo $+ $network $+ .ini, $chan, [ $+ [ %auth ] ]) 
  }
}
