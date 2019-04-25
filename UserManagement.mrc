on *:text:$k *:*: {
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if ($nick isop # || %god [ $+ [ %auth ] ] == 1) {
    if (!$3) {
      kick # $2 Kicked by $nick (Bye.)
    }
    else { kick # $2 Kicked by $nick ( $+ $3- $+ ) }
  }
}
on *:TEXT:$set *:*: {
  whois $nick 
  set %auth $readini(dafauth.ini, nicks, $nick) 
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, setters) || %god [ $+ [ %auth ] ] == 1) {
    if ($3 == 0 || $3 == 1 || $3 == 2 || $3 == 3) {
      if ($2 == Autovoice) {
        writeini set $+ $network $+ .ini $chan Autovoice $3
        notice $Nick Autovoice: $3
        halt
      }
      if ($2 == protect) {
        writeini set $+ $network $+ .ini $chan protect $3
        notice $nick Protect: $3
        halt
      } 
    }
    if ($3 == 100 || $3 == 200 || $3 == 300 || $3 == 400 || $3 == 500) {   
      if ($2 == InviteMe) {
        writeini set $+ $network $+ .ini $chan InviteMe $3
        notice $Nick InviteMe: $3
        halt
      }
      if ($2 == Setters) {
        writeini set $+ $network $+ .ini $chan Setters $3
        notice $Nick Setters: $3
        halt
      }
      if ($2 == Giveops) {
        writeini set $+ $network $+ .ini $chan giveops $3
        notice $nick Giveops: $3
        halt
      }
      if ($2 == Givevoice) {
        writeini set $+ $network $+ .ini $chan givevoice $3
        notice $nick Givevoice: $3
        halt
      }
      if ($2 == Userscript) {
        writeini set $+ $network $+ .ini $chan Userscript $3
        notice $nick Userscript: $3
        halt
      }
      if ($2 == uset) {
        writeini set $+ $network $+ .ini $chan uset $3
        notice $nick Uset: $3
        halt
      } 
      if ($2 == Bans) {
        writeini set $+ $network $+ .ini $chan bans $3
        notice $Nick Bans: $3
        halt
      }
      if ($2 == Enfops) {
        writeini set $+ $network $+ .ini $chan Enfops $3
        notice $nick Enfops: $3
        halt
      }
      if ($2 == Enfvoice) {
        writeini set $+ $network $+ .ini $chan EnfVoice $3
        notice $nick EnfVoice: $3
        halt
      }
      set %a [
      set %b ]
      msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :Change Set
      else { Notice $nick the access levels are: 100 (peon) 200 (op) 300 (master) 400 (Co-Owner) 500 (Owner) }
    }
  }
  else { 
    notice $Nick You lack acces to $chan  $+ .
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b %a $+ Lack access $+ %b $1 $+ :Change Set
  }
}
on *:TEXT:$set:#: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, setters) || %god [ $+ [ %auth ] ] == 1) {
    notice $Nick $chan Settings. (set)
    notice $nick Setters: $readini(set $+ $network $+ .ini, $chan, setters)
    notice $nick GiveOps: $readini(set $+ $network $+ .ini, $chan, Giveops)
    notice $nick GiveVoice: $readini(set $+ $network $+ .ini, $chan, GiveVoice)
    notice $nick Userscript: $readini(set $+ $network $+ .ini, $chan, Userscript)
    notice $nick Protect: $readini(set $+ $network $+ .ini, $chan, protect)
    notice $nick Autovoice: $readini(set $+ $network $+ .ini, $chan, Autovoice)
    notice $nick Inviteme: $readini(set $+ $network $+ .ini, $chan, Inviteme)
    notice $nick Uset: $readini(set $+ $network $+ .ini, $chan, Uset)
    notice $nick Bans: $readini(set $+ $network $+ .ini, $chan, bans)
    notice $nick Enfops: $readini(set $+ $network $+ .ini, $chan, EnfOps)
    notice $nick EnfVoice: $readini(set $+ $network $+ .ini, $chan, EnfVoice)
    Notice $nick End of Set $+ .
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :View Set
  }
  else { 
    notice $nick You lack access to $chan $+ . 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b %a $+ Lack access $+ %b $1 $+ :View Set
  }
}
on *:JOIN:#: {
  if ($nick == $me) { who $chan (%nacf) }
  else { 
    whois $nick
    set %auth $readini(dafauth.ini, nicks, $nick)
    set %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ] )
    if ($readini(bans $+ $network $+ .ini, $chan, $address($nick, 2))) { 
      mode $chan +b $address($nick, 2)
      kick $chan $Nick Banned by $readini(bans3 $+ $network $+ .ini, $chan, $address($nick, 2)) ( $+ $readini(bans2 $+ $network $+ .ini, $chan, $address($nick, 2)) $+ )
      HALT
    }
    if (%access >= $readini(set $+ $network $+ .ini, $chan, giveops) && %access != $null) { mode # +ov $nick | Halt }
    if ($readini(set $+ $network $+ .ini, $chan, Autovoice) == 1 || $readini(set $+ $network $+ .ini, $chan, Autovoice) == 2 || $readini(set $+ $network $+ .ini, $chan, Autovoice) == 3) { mode # +v $nick }
    if ($ini(uset $+ $network $+ .ini, [ %auth $+ [ $chan ] ], joininfo) != $Null) { timer 1 1 msg # $readini(uset $+ $network $+ .ini, [ %auth $+ [ $chan ] ], joininfo) }
    if (%access >= $readini(set $+ $network $+ .ini, $chan, givehalfop) && %access != $null) { mode # +h $nick | halt }
    if (%access >= $readini(set $+ $network $+ .ini, $chan, givevoice) && %access != $null) { mode # +v $nick | halt }
  }
}
on *:text:$inviteme *:*: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $2 $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $2, inviteme) || %god [ $+ [ %auth ] ] == 1) {
    invite $nick $2 
    notice $Nick You have been invited to $2 $+ .
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :Inviteme
  }
  else { 
    notice $nick you lack access to $chan $+ . 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b %a $+ Lack access $+ %b $1 $+ :Resync
  }
}
on *:text:$resync:#: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, userscript) || %god [ $+ [ %auth ] ] == 1) {
    var %t $nick($chan, 0)
    var %c 0 
    while (%c < %t) {
      inc %c
      var %auth $readini(dafauth.ini, nicks, $nick($chan, %c))
      var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
      if (%access == $null && $nick($chan, %c) != $me) { m -ov $nick($chan, %c) }
      if (%access >= $readini(set $+ $network $+ .ini, $chan, giveops) && $nick($chan, %c) !isop $chan && $nick($chan, %c) != $me) { m +o $nick($chan, %c) }
      if (%access < $readini(set $+ $network $+ .ini, $chan, giveops) && $nick($chan, %c) isop $chan && $nick($chan, %c) != $me) { m -o $nick($chan, %c) }
      if (%access >= $readini(set $+ $network $+ .ini, $chan, givevoice) && $nick($chan, %c) !isvoice $chan && $nick($chan, %c) != $me && %access < $readini(set $+ $network $+ .ini, $chan, giveops)) { m +v $nick($chan, %c) }
      if (%access < $readini(set $+ $network $+ .ini, $chan, givevoice) && $nick($chan, %c) isvoice $chan && $nick($chan, %c) != $me) { m -v $nick($chan, %c) }
    }
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :Resync
  }
  else { 
    notice $nick you lack access to $chan $+ . 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b %a $+ Lack access $+ %b $1 $+ :Resync
  }
}
on *:TEXT:$up:#: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, giveops)) { 
    mode # +o $nick 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :Up op 
    Halt 
  }
  if (%access >= $readini(set $+ $network $+ .ini, $chan, givehalfop)) { 
    mode # +h $nick 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :Up Halfop
    halt 
  }
  if (%access >= $readini(set $+ $network $+ .ini, $chan, givevoice)) { 
    mode # +v $nick 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :Up Voice
    halt 
  }
}
on *:OP:#: {
  whois $Nick
  if ($nick == $me) { halt }
  if ($opnick == $me) { halt }
  set %auth $readini(dafauth.ini, nicks, $nick)
  set %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  set %auth2 $readini(dafauth.ini, nicks, $opnick)
  set %access2 $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth2 ] ])
  if ($readini(set $+ $network $+ .ini, $chan, Protect) == 0) { HALT }
  if (%god [ $+ [ %auth ] ] == 1) { halt }
  if ($readini(set $+ $network $+ .ini, $chan, protect) == 1) { 
    if (%access < $readini(set $+ $network $+ .ini, $chan, Enfops) || %access == $nul) {
      mode # -o $opnick
    }
  }
  if ($readini(set $+ $network $+ .ini, $chan, protect) == 2) { 
    if (%access < $readini(set $+ $network $+ .ini, $chan, Enfops) || %access == $null) {
      mode # -o $opnick
      mode # -o $nick
    }
  }
  if ($readini(set $+ $network $+ .ini, $chan, protect) == 3) { 
    if (%access < $readini(set $+ $network $+ .ini, $chan, Enfops) || %access == $null) {
      mode # -o $opnick
      mode # -ov $nick
      mode # +b $address($nick, 2)
      writeini bans $+ $network $+ .ini $chan $address($nick,2) $address($nick,2)
      writeini bans2 $+ $network $+ .ini $chan $address($nick,2) Abuser
      writeini bans3 $+ $network $+ .ini $chan $address($nick,2) Daffy
      kick $chan $nick
      timer 1 300 mode # -b $address($nick, 2)
	  timer 1 300 remini bans $+ $network $+ .ini $chan $address($nick,2)
	  timer 1 300 remini bans2 $+ $network $+ .ini $chan $address($nick,2)
	  timer 1 300 remini bans3 $+ $network $+ .ini $chan $address($nick,2)
    }
  }
}
on *:DEOP:#: {
  whois $Nick
  if ($nick == $me) { halt }
  if ($opnick == $me) { halt }
  set %auth $readini(dafauth.ini, nicks, $nick)
  set %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  set %auth2 $readini(dafauth.ini, nicks, $opnick)
  set %access2 $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth2 ] ])
  if ($readini(set $+ $network $+ .ini, $chan, Protect) == 0) { HALT }
  if (%god [ $+ [ %auth ] ] == 1) { halt }
  if ($readini(set $+ $network $+ .ini, $chan, protect) == 1) { 
    if (%access < $readini(set $+ $network $+ .ini, $chan, Enfops) || %access == $null || %access2 < $readini(set $+ $network $+ .ini, $chan, giveops)) {
      mode # +o $opnick
    }
  }
  if ($readini(set $+ $network $+ .ini, $chan, protect) == 2) { 
    if (%access < $readini(set $+ $network $+ .ini, $chan, Enfops) || %access == $null || %access2 < $readini(set $+ $network $+ .ini, $chan, giveops)) {
      mode # +o $opnick
      mode # -o $nick
    }
  }
  if ($readini(set $+ $network $+ .ini, $chan, protect) == 3) { 
    if (%access < $readini(set $+ $network $+ .ini, $chan, Enfops) || %access == $null || %access2 < $readini(set $+ $network $+ .ini, $chan, giveops)) {
      mode # +o $opnick
      mode # -ov $nick $nick
      mode # +b $address($nick, 2)
      writeini bans $+ $network $+ .ini $chan $address($nick,2) $address($nick,2)
      writeini bans2 $+ $network $+ .ini $chan $address($nick,2) Abuser
      writeini bans3 $+ $network $+ .ini $chan $address($nick,2) Daffy
      kick $chan $nick
      timer 1 300 mode # -b $address($nick, 2)
	  timer 1 300 remini bans $+ $network $+ .ini $chan $address($nick,2)
	  timer 1 300 remini bans2 $+ $network $+ .ini $chan $address($nick,2)
	  timer 1 300 remini bans3 $+ $network $+ .ini $chan $address($nick,2)
    }
  }
}

on *:TEXT:$down:#: { 
  m -ov $nick $nick
  set %a [
  set %b ]
  msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :Down 
}
on *:TEXT:$a:#: { 
  whois $nick
  set %auth $readini(dafauth.ini, nicks, $nick)
  if (!$readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])) { 
    notice $Nick You dont have access to $chan $+ . 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :Check access
    if ($readini(admins.ini, admins, [ $+ [ %auth ] $+ ])) { notice $Nick $nick has $readini(admins.ini, admins2, [ $+ [ %auth ] $+ ]) oaccess. }
    if (%god [ $+ [ %auth ] ] == 1) { Notice $Nick $nick has god mode enabled }
  }
  else { 
    notice $Nick You have $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ]) access
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :Check access
    if ($readini(admins.ini, admins, [ $+ [ %auth ] $+ ])) { notice $Nick $nick has $readini(admins.ini, admins2, [ $+ [ %auth ] $+ ]) oaccess. }
    if (%god [ $+ [ %auth ] ] == 1) { Notice $Nick $nick has god mode enabled }
    Notice $Nick $readini(uset $+ $network $+ .ini, [ %auth $+ [ $chan ] ], Ainfo)
  }
}
on *:TEXT:$a *:*: { 
  whois $2
  var %auth $readini(dafauth.ini, nicks, $2)
  if (!$readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])) {
    notice $nick $2 dont have access to $chan $+ .
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :Check access $2- 
    if ($readini(admins.ini, admins, [ $+ [ %auth ] $+ ])) { notice $Nick $2 has $readini(admins.ini, admins2, [ $+ [ %auth ] $+ ]) oaccess. }
    if (%god [ $+ [ %auth ] ] == 1) { Notice $Nick $2 has god mode enabled }
  }
  else { 
    notice $Nick $2 have $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ]) access
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :Check access $2-
    if ($readini(admins.ini, admins, [ $+ [ %auth ] $+ ])) { notice $Nick $2 has $readini(admins.ini, admins2, [ $+ [ %auth ] $+ ]) oaccess. }
    if (%god [ $+ [ %auth ] ] == 1) { Notice $Nick $2 has god mode enabled }
  }
}
on *:TEXT:$addpeon*:#: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, Userscript) || %god [ $+ [ %auth ] ] == 1) {
    whois $2
    var %user $readini(dafauth.ini, nicks, $2)
    if (!$2) { notice $nick Use: $adduser <nickname> <level> (Withouth <> ) | HALT }
    if ($2 !ison $chan) { notice $nick The user has to be on the channel. | HALT }
    if (100 >= %access && %god [ $+ [ %auth ] ] != 1) { notice $nick You cant give users higher or equal access as you. | HALT }
    if ($2 == $nick && %god [ $+ [ %auth ] ] != 1) { notice $Nick You cant give yourself access. | HALT }
    if ($ini(users $+ $network $+ .ini, users, [ $+ [ %user ] ])) { notice $Nick $2 is already on the userlist. | HALT }
    else {
      writeini users $+ $network $+ .ini $chan $+ 100 $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
      writeini users $+ $network $+ .ini $chan $+ Users $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
      writeini users $+ $network $+ .ini $chan $+ access $readini(dafauth.ini, nicks, $2) 100
      writeini ma.ini $readini(dafauth.ini, nicks, $2) $+ 100 $chan $chan
      notice $nick Peon $2 added with level 100
      set %a [
      set %b ]
      msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :adduser $2 100
    }
  }
  else { 
    notice $Nick you lack access to $chan $+ .
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b %a $+ Lack access $+ %b $1 $+ :Adduser $2 100  
  }
}
on *:TEXT:$addop*:#: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, Userscript) || %god [ $+ [ %auth ] ] == 1) {
    whois $2
    var %user $readini(dafauth.ini, nicks, $2)
    if (!$2) { notice $nick Use: $adduser <nickname> <level> (Withouth <> ) | HALT }
    if ($2 !ison $chan) { notice $nick The user has to be on the channel. | HALT }
    if (200 >= %access && %god [ $+ [ %auth ] ] != 1) { notice $nick You cant give users higher or equal access as you. | HALT }
    if ($2 == $nick && %god [ $+ [ %auth ] ] != 1) { notice $Nick You cant give yourself access. | HALT }
    if ($ini(users $+ $network $+ .ini, users, [ $+ [ %user ] ])) { notice $Nick $2 is already on the userlist. | HALT }
    else {
      writeini users $+ $network $+ .ini $chan $+ 200 $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
      writeini users $+ $network $+ .ini $chan $+ Users $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
      writeini users $+ $network $+ .ini $chan $+ access $readini(dafauth.ini, nicks, $2) 200
      writeini ma.ini $readini(dafauth.ini, nicks, $2) $+ 200 $chan $chan
      notice $nick Op $2 added with level 200
      set %a [
      set %b ]
      msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :adduser $2 200
    }
  }
  else { 
    notice $Nick you lack access to $chan $+ .
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b %a $+ Lack access $+ %b $1 $+ :Adduser $2 200  
  }
}
on *:TEXT:$addmaster*:#: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, Userscript) || %god [ $+ [ %auth ] ] == 1) {
    whois $2
    var %user $readini(dafauth.ini, nicks, $2)
    if (!$2) { notice $nick Use: $adduser <nickname> <level> (Withouth <> ) | HALT }
    if ($2 !ison $chan) { notice $nick The user has to be on the channel. | HALT }
    if (300 >= %access && %god [ $+ [ %auth ] ] != 1) { notice $nick You cant give users higher or equal access as you. | HALT }
    if ($2 == $nick && %god [ $+ [ %auth ] ] != 1) { notice $Nick You cant give yourself access. | HALT }
    if ($ini(users $+ $network $+ .ini, users, [ $+ [ %user ] ])) { notice $Nick $2 is already on the userlist. | HALT }
    else {
      writeini users $+ $network $+ .ini $chan $+ 300 $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
      writeini users $+ $network $+ .ini $chan $+ Users $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
      writeini users $+ $network $+ .ini $chan $+ access $readini(dafauth.ini, nicks, $2) 300
      writeini ma.ini $readini(dafauth.ini, nicks, $2) $+ 300 $chan $chan
      notice $nick Master $2 added with level 300
      set %a [
      set %b ]
      msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :adduser $2 300
    }
  }
  else { 
    notice $Nick you lack access to $chan $+ . 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b %a $+ Lack access $+ %b $1 $+ :Adduser $2 300  
  }
}
on *:TEXT:$addcoowner*:#: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, Userscript) || %god [ $+ [ %auth ] ] == 1) {
    whois $2
    var %user $readini(dafauth.ini, nicks, $2)
    if (!$2) { notice $nick Use: $adduser <nickname> <level> (Withouth <> ) | HALT }
    if ($2 !ison $chan) { notice $nick The user has to be on the channel. | HALT }
    if (400 >= %access && %god [ $+ [ %auth ] ] != 1) { notice $nick You cant give users higher or equal access as you. | HALT }
    if ($2 == $nick && %god [ $+ [ %auth ] ] != 1) { notice $Nick You cant give yourself access. | HALT }
    if ($ini(users $+ $network $+ .ini, users, [ $+ [ %user ] ])) { notice $Nick $2 is already on the userlist. | HALT }
    else {
      writeini users $+ $network $+ .ini $chan $+ 400 $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
      writeini users $+ $network $+ .ini $chan $+ Users $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
      writeini users $+ $network $+ .ini $chan $+ access $readini(dafauth.ini, nicks, $2) 400
      writeini ma.ini $readini(dafauth.ini, nicks, $2) $+ 400 $chan $chan
      notice $nick Co-Owner $2 added with level 400
      set %a [
      set %b ]
      msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :adduser $2 400
    }
  }
  else { 
    notice $Nick you lack access to $chan $+ . 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b %a $+ Lack access $+ %b $1 $+ :Adduser $2 400  
  }
}
on *:TEXT:$addowner*:#: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%god [ $+ [ %auth ] ] == 1) {
    whois $2
    var %user $readini(dafauth.ini, nicks, $2)
    if (!$2) { notice $nick Use: $adduser <nickname> <level> (Withouth <> ) | HALT }
    if ($2 !ison $chan) { notice $nick The user has to be on the channel. | HALT }
    if ($ini(users $+ $network $+ .ini, users, [ $+ [ %user ] ])) { notice $Nick $2 is already on the userlist. | HALT }
    else {
      writeini users $+ $network $+ .ini $chan $+ 500 $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
      writeini users $+ $network $+ .ini $chan $+ Users $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
      writeini users $+ $network $+ .ini $chan $+ access $readini(dafauth.ini, nicks, $2) 500
      writeini ma.ini $readini(dafauth.ini, nicks, $2) $+ 500 $chan $chan
      notice $nick Owner $2 added with level 500
      set %a [
      set %b ]
      msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :adduser $2 500
    }
  }
  else { 
    notice $Nick you need to have god mode enabled for this command.. 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b %a $+ Lack access $+ %b $1 $+ :Adduser $2 400 
  }
}
on *:text:$readusers:#: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, Userscript) || %god [ $+ [ %auth ] ] == 1) {
    who # (%nacf)
    var %c 0
    var %t $nick($chan, 0)
    while (%c < %t) { 
      inc %c
      var %auth $readini(dafauth.ini, nicks, $nick($chan, [ [ %c ] ]))
      var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
      if ($nick($chan, %c) isop # && %access != 100 && %access != 200 && %access != 300 && %access != 400 && %access != 500) { 
        writeini users $+ $network $+ .ini $chan $+ 300  $readini(dafauth.ini, nicks, $nick($chan, %c)) $readini(dafauth.ini, nicks, $nick($chan, %c))
        writeini users $+ $network $+ .ini $chan $+ Users $readini(dafauth.ini, nicks, $nick($chan, %c)) $readini(dafauth.ini, nicks, $nick($chan, %c))
        writeini users $+ $network $+ .ini $chan $+ access $readini(dafauth.ini, nicks, $nick($chan, %c)) 300
        writeini ma.ini $readini(dafauth.ini, nicks, $nick($chan, %c)) $+ 300 $chan $chan
      }
      if ($nick($chan, %c) isvoice # && %access != 100 && %access != 200 && %access != 300 && %access != 400 && %access != 500) {
        writeini users $+ $network $+ .ini $chan $+ 100  $readini(dafauth.ini, nicks, $nick($chan, %c)) $readini(dafauth.ini, nicks, $nick($chan, %c))
        writeini users $+ $network $+ .ini $chan $+ Users $readini(dafauth.ini, nicks, $nick($chan, %c)) $readini(dafauth.ini, nicks, $nick($chan, %c))
        writeini users $+ $network $+ .ini $chan $+ access $readini(dafauth.ini, nicks, $nick($chan, %c)) 100
        writeini ma.ini $readini(dafauth.ini, nicks, $nick($chan, %c)) $+ 100 $chan $chan
      }
    }
    notice $Nick Users added.
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :Readusers $2 500
  }
  else { 
    notice $Nick you lack access to $chan $+ . 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b %a $+ Lack access $+ %b $1 $+ :Readusers
  }
}
on *:TEXT:$adduser*:#: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, Userscript) || %god [ $+ [ %auth ] ] == 1) {
    whois $2
    var %user $readini(dafauth.ini, nicks, $2)
    if (!$3) { notice $nick Use: $adduser <nickname> <level> (Withouth <> ) | HALT }
    if ($2 !ison $chan) { notice $nick The user has to be on the channel. | HALT }
    if ($3 == 500 && %god [ $+ [ %auth ] ] != 1) { notice $Nick You cant give users Access 500. | HALT }
    if ($3 >= %access && %god [ $+ [ %auth ] ] != 1) { notice $nick You cant give users higher or equal access as you. | HALT }
    if ($2 == $nick && %god [ $+ [ %auth ] ] != 1) { notice $Nick You cant give yourself access. | HALT }
    if ($ini(users $+ $network $+ .ini, users, [ $+ [ %user ] ])) { notice $Nick $2 is already on the userlist. | HALT }
    if ($3 == 500 || $3 == 100 || $3 == 200 || $3 == 300 || $3 == 400) { 
      writeini users $+ $network $+ .ini $chan $+ $3 $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
      writeini users $+ $network $+ .ini $chan $+ Users $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
      writeini users $+ $network $+ .ini $chan $+ access $readini(dafauth.ini, nicks, $2) $3
      writeini ma.ini $readini(dafauth.ini, nicks, $2) $+ $3 $chan $chan
      notice $nick User $2 added with level $3
      set %a [
      set %b ]
      msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :adduser $2-
    }
    else { 
      notice $nick The access levels are: 100(peon), 200(op), 300(master), 400(co-owner), 500(owner)
      set %a [
      set %b ]
      msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :adduser $2- 
      HALT 
    }
  }
  else { 
    notice $Nick you lack access to $chan $+ . 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b %a $+ Lack access $+ %b $1 $+ :Adduser $2-
  }
}
on *:TEXT:$deluser*:#: { 
  whoist $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, Userscript) || %god [ $+ [ %auth ] ] == 1) {
    whois $2
    var %user $readini(dafauth.ini, nicks, $2)
    notice $nick User deleted.
    remini users $+ $network $+ .ini $chan $+ access $readini(dafauth.ini, nicks, $2)
    remini users $+ $network $+ .ini $chan $+ Users $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
    remini users $+ $network $+ .ini $chan $+ 500 $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
    remini users $+ $network $+ .ini $chan $+ 400 $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
    remini users $+ $network $+ .ini $chan $+ 300 $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
    remini users $+ $network $+ .ini $chan $+ 200 $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
    remini users $+ $network $+ .ini $chan $+ 100 $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
    remini ma.ini $readini(dafauth.ini, nicks, $2) $+ 500 $chan
    remini ma.ini $readini(dafauth.ini, nicks, $2) $+ 400 $chan
    remini ma.ini $readini(dafauth.ini, nicks, $2) $+ 300 $chan
    remini ma.ini $readini(dafauth.ini, nicks, $2) $+ 200 $chan
    remini ma.ini $readini(dafauth.ini, nicks, $2) $+ 100 $chan
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :Deluser $2- 
    else { 
      notice $nick This user is not on the userlist. 
      set %a [
      set %b ]
      msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b %a $+ Lack access $+ %b $1 $+ :Deluser $2- 
    }
  }
  else { 
    notice $Nick you lack access to $chan $+ . 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b %a $+ Lack access $+ %b $1 $+ :Deluser $2-
  }
}
on *:TEXT:$clvl*:#: {
  whoist $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, Userscript) || %god [ $+ [ %auth ] ] == 1) {
    whois $2
    var %user $readini(dafauth.ini, nicks, $2)
    if (!$3) { notice $nick Use: $clvl <nickname> <level> (Withouth <>) | HALT }
    if ($2 !ison $chan) { notice $nick The user have to be on # $+ . | HALT }
    if ($3 == 500 && %god [ $+ [ %auth ] ] != 1) { notice $Nick You cant give users Access 500. | HALT }
    if ($2 == $nick && %god [ $+ [ %auth ] ] != 1) { notice $Nick You cant change your own access. | HALT }
    if ($3 >= %access && %god [ $+ [ %auth ] ] != 1) { notice $nick You cant give users higher or equal access as you. | HALT }
    if (!$ini(users $+ $network $+ .ini, $chan $+ users, [ $+ [ %user ] ])) { notice $Nick This user is not on the userlist. . | HALT }
    if ($3 == 500 || $3 == 100 || $3 == 200 || $3 == 300 || $3 == 400) { 
      remini users $+ $network $+ .ini $chan $+ Users $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
      remini users $+ $network $+ .ini $chan $+ 500 $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
      remini users $+ $network $+ .ini $chan $+ 400 $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
      remini users $+ $network $+ .ini $chan $+ 300 $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
      remini users $+ $network $+ .ini $chan $+ 200 $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
      remini users $+ $network $+ .ini $chan $+ 100 $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
      remini ma.ini $readini(dafauth.ini, nicks, $2) $+ 500 $chan
      remini ma.ini $readini(dafauth.ini, nicks, $2) $+ 400 $chan
      remini ma.ini $readini(dafauth.ini, nicks, $2) $+ 300 $chan
      remini ma.ini $readini(dafauth.ini, nicks, $2) $+ 200 $chan
      remini ma.ini $readini(dafauth.ini, nicks, $2) $+ 100 $chan
      writeini users $+ $network $+ .ini $chan $+ $3 $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
      writeini users $+ $network $+ .ini $chan $+ Users $readini(dafauth.ini, nicks, $2) $readini(dafauth.ini, nicks, $2)
      writeini users $+ $network $+ .ini $chan $+ access $readini(dafauth.ini, nicks, $2) $3
      writeini ma.ini $readini(dafauth.ini, nicks, $2) $+ $3 $chan $chan
      notice $nick User $2 access changed to $3
    }
    else { 
      notice $nick The access levels are: 100(peon), 200(op), 300(master), 400(co-owner), 500(owner)
      set %a [
      set %b ]
      msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :clvl $2- 
      HALT 
    }
  }
  else {
    notice $Nick you lack access to $chan $+ . 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b %a $+ Lack access $+ %b $1 $+ :clvl $2-

  }
}
on *:text:$peons:#: {
  notice $nick # Peons.
  notice $nick Level         Status                  User
  var %c 0
  var %t $ini(users $+ $network $+ .ini, $chan $+ 100, 0)
  while (%c < %t) { 
    inc %c
    notice $nick 100          Peon                     $readini(users $+ $network $+ .ini, $chan $+ 100, $ini(users $+ $network $+ .ini, $chan $+ 100, %c)) 
  }
  notice $nick End of Users.
  var %auth $readini(dafauth.ini, nicks, $nick)
  set %a [
  set %b ]
  msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :Peons
}
on *:text:$ops:#: {
  notice $nick # Ops.
  notice $nick Level         Status                  User
  var %c 0
  var %t $ini(users $+ $network $+ .ini, $chan $+ 200, 0)
  while (%c < %t) { 
    inc %c
    notice $nick 200          Op                        $readini(users $+ $network $+ .ini, $chan $+ 200, $ini(users $+ $network $+ .ini, $chan $+ 200, %c)) 
  }
  notice $nick End of Users.
  var %auth $readini(dafauth.ini, nicks, $nick)
  set %a [
  set %b ]
  msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :Ops
}
on *:text:$Masters:#: {
  notice $nick # Masters.
  notice $nick Level         Status                  User
  var %c 0
  var %t $ini(users $+ $network $+ .ini, $chan $+ 300, 0)
  while (%c < %t) { 
    inc %c
    notice $nick 300          Master                  $readini(users $+ $network $+ .ini, $chan $+ 300, $ini(users $+ $network $+ .ini, $chan $+ 300, %c)) 
  }
  notice $nick End of Users.
  var %auth $readini(dafauth.ini, nicks, $nick)
  set %a [
  set %b ]
  msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :Masters
}
on *:text:$coowners:#: {
  notice $nick # Co-Owners.
  notice $nick Level         Status                  User
  var %c 0
  var %t $ini(users $+ $network $+ .ini, $chan $+ 400, 0)
  while (%c < %t) { 
    inc %c
    notice $nick 400          Co-Owner            $readini(users $+ $network $+ .ini, $chan $+ 400, $ini(users $+ $network $+ .ini, $chan $+ 400, %c)) 
  }
  notice $nick End of Users.
  var %auth $readini(dafauth.ini, nicks, $nick)
  set %a [
  set %b ]
  msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :Co-Owners
}
on *:text:$owners:#: {
  notice $nick # Owners.
  notice $nick Level         Status                  User
  var %c 0
  var %t $ini(users $+ $network $+ .ini, $chan $+ 500, 0)
  while (%c < %t) { 
    inc %c
    notice $nick 500          Owner                  $readini(users $+ $network $+ .ini, $chan $+ 500, $ini(users $+ $network $+ .ini, $chan $+ 500, %c)) 
  }
  notice $nick End of Users.
  var %auth $readini(dafauth.ini, nicks, $nick)
  set %a [
  set %b ]
  msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :Owners
}
on *:TEXT:$users:#: {
  notice $nick # Users.
  notice $nick Level         Status                  User
  var %c 0
  var %t $ini(users $+ $network $+ .ini, $chan $+ 500, 0)
  while (%c < %t) { 
    inc %c
    notice $nick 500          Owner                  $readini(users $+ $network $+ .ini, $chan $+ 500, $ini(users $+ $network $+ .ini, $chan $+ 500, %c)) 
  }
  var %c 0
  var %t $ini(users $+ $network $+ .ini, $chan $+ 400, 0)
  while (%c < %t) { 
    inc %c
    notice $nick 400          Co-Owner            $readini(users $+ $network $+ .ini, $chan $+ 400, $ini(users $+ $network $+ .ini, $chan $+ 400, %c)) 
  }
  var %c 0
  var %t $ini(users $+ $network $+ .ini, $chan $+ 300, 0)
  while (%c < %t) { 
    inc %c
    notice $nick 300          Master                  $readini(users $+ $network $+ .ini, $chan $+ 300, $ini(users $+ $network $+ .ini, $chan $+ 300, %c)) 
  }
  var %c 0
  var %t $ini(users $+ $network $+ .ini, $chan $+ 200, 0)
  while (%c < %t) { 
    inc %c
    notice $nick 200          Op                        $readini(users $+ $network $+ .ini, $chan $+ 200, $ini(users $+ $network $+ .ini, $chan $+ 200, %c)) 
  }
  var %c 0
  var %t $ini(users $+ $network $+ .ini, $chan $+ 100, 0)
  while (%c < %t) { 
    inc %c
    notice $nick 100          Peon                     $readini(users $+ $network $+ .ini, $chan $+ 100, $ini(users $+ $network $+ .ini, $chan $+ 100, %c)) 
  }
  notice $nick End of Users.
  var %auth $readini(dafauth.ini, nicks, $nick)
  set %a [
  set %b ]
  msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 000 $+ %b $1 $+ :Users
}
