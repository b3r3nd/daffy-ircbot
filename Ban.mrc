\RAW 367:**: {
  Writeini bans $+ $network $+ .ini %chan $3 $3
  writeini bans2 $+ $network $+ .ini %chan $3 Channel bans
  Writeini bans3 $+ $network $+ .ini %chan $3 $4
}
on *:text:$savebans:#: { 
  whois $Nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, bans) || %god [ $+ [ %auth ] ] == 1) { 
    set %chan $chan
    mode # -b 
    notice $nick Bans saved.
  }
  else { notice $nick You lack access to $chan $+ .
  }
}
on *:text:$rban:#: {
  whois $Nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, bans) || %god [ $+ [ %auth ] ] == 1) { 
    set %c 0
    set %d 1
    set %e 2
    set %f 3
    set %g 4
    set %t $nick($chan, 0)
    while (%c < %t) { 
      mode # +bbbbb $readini(bans $+ $network $+ .ini, $chan, $ini(bans $+ $network $+ .ini, $chan, %c)) $readini(bans $+ $network $+ .ini, $chan, $ini(bans $+ $network $+ .ini, $chan, %d)) $readini(bans $+ $network $+ .ini, $chan, $ini(bans $+ $network $+ .ini, $chan, %e)) $readini(bans $+ $network $+ .ini, $chan, $ini(bans $+ $network $+ .ini, $chan, %f)) $readini(bans $+ $network $+ .ini, $chan, $ini(bans $+ $network $+ .ini, $chan, %g))
      inc %c 5
      inc %d 5
      inc %e 5
      inc %f 5
      inc %g 5
    }
  }
  else { notice $nick You lack access to $chan $+ .
  }
}
on *:UNBAN:#: {
  whois $Nick
  if ($nick == $me) { halt }
  set %auth $readini(dafauth.ini, nicks, $nick)
  set %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if ($readini(set $+ $network $+ .ini, $chan, Protect) == 0) { HALT }
  if (%god [ $+ [ %auth ] ] == 1) { halt }
  if ($readini(set $+ $network $+ .ini, $chan, protect) == 1) { 
    if (%access < $readini(set $+ $network $+ .ini, $chan, bans) || %access == $null) {
      mode # +b $banmask
    }
  }
  if ($readini(set $+ $network $+ .ini, $chan, protect) == 2) { 
    if (%access < $readini(set $+ $network $+ .ini, $chan, bans) || %access == $null) {
      mode # +b $banmask
      mode # -o $nick
    }
  }
  if ($readini(set $+ $network $+ .ini, $chan, protect) == 3) { 
    if (%access < $readini(set $+ $network $+ .ini, $chan, bans) || %access == $null) {
      mode # +b $banmask
      mode # -o $nick
      mode # +b $address($nick, 2)
      writeini bans $+ $network $+ .ini $chan $address($nick,2) $address($nick,2)
      writeini bans2 $+ $network $+ .ini $chan $address($nick,2) Abuser
      writeini bans3 $+ $network $+ .ini $chan $address($nick,2) Daffy
      kick $chan $nick
      timer 1 300 mode # -b $address($nick, 2)
    }
  }
}
on *:BAN:#: {
  whois $Nick
  if ($nick == $me) { halt }
  set %auth $readini(dafauth.ini, nicks, $nick)
  set %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if ($readini(set $+ $network $+ .ini, $chan, Protect) == 0) { HALT }
  if (%god [ $+ [ %auth ] ] == 1) { halt }
  if ($readini(set $+ $network $+ .ini, $chan, protect) == 1) { 
    if (%access < $readini(set $+ $network $+ .ini, $chan, bans) || %access == $null) {
      mode # -b $banmask
    }
  }
  if ($readini(set $+ $network $+ .ini, $chan, protect) == 2) { 
    if (%access < $readini(set $+ $network $+ .ini, $chan, bans) || %access == $null) {
      mode # -b $banmask
      mode # -o $nick
    }
  }
  if ($readini(set $+ $network $+ .ini, $chan, protect) == 3) { 
    if (%access < $readini(set $+ $network $+ .ini, $chan, bans) || %access == $null) {
      mode # -b $banmask
      mode # -o $nick
      mode # +b $address($nick, 2)
      writeini bans $+ $network $+ .ini $chan $address($nick,2) $address($nick,2)
      writeini bans2 $+ $network $+ .ini $chan $address($nick,2) Abuser
      writeini bans3 $+ $network $+ .ini $chan $address($nick,2) Daffy
      kick $chan $nick
      timer 1 300 mode # -b $address($nick, 2)
    }
  }
}
on *:TEXT:$addban *:*: {
  whois $Nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, bans) || %god [ $+ [ %auth ] ] == 1) { 
    whois $2
    writeini bans $+ $network $+ .ini $chan $2 $2
    writeini bans3 $+ $network $+ .ini $chan $2 $nick
    notice $nick $2 Is banned from $chan $+ .
    mode $chan +b $2
    writeini bans2 $+ $network $+ .ini $chan $2 $3-
    writeini bans $+ $network $+ .ini $chan $address($2, 2) $address($2, 2)
    writeini bans3 $+ $network $+ .ini $chan $address($2, 2) $nick
    notice $nick $address($2, 2) Is banned from $chan $+ .
    mode $chan +b $address($2, 2)
    writeini bans2 $+ $network $+ .ini $chan $address($2, 2) $3-
  }
  else { notice $nick You lack access to $chan $+ .
  }
}
on *:TEXT:$bans:#: {
  whois $Nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, bans) || %god [ $+ [ %auth ] ] == 1) {
    notice $nick  $+ $chan Bans.
    notice $nick Host                                                                       Reason                                                   Banned by
    var %c 0
    var %t $ini(bans $+ $network $+ .ini, $chan, 0)
    while (%c < %t) {
      inc %c
      notice $nick $readini(bans $+ $network $+ .ini, $chan, $ini(bans $+ $network $+ .ini, $chan, %c))                     $readini(bans2 $+ $network $+ .ini, $chan, $readini(bans $+ $network $+ .ini, $chan, $ini(bans $+ $network $+ .ini, $chan, %c)))                                         $readini(bans3 $+ $network $+ .ini, $chan, $readini(bans $+ $network $+ .ini, $chan, $ini(bans $+ $network $+ .ini, $chan, %c)))
    }
    notice $nick  $+ %c bans found.
  }
  else { notice $nick You lack access to $chan $+ .
  }
}
on *:text:$delbanall:#: {
  whois $Nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, bans) || %god [ $+ [ %auth ] ] == 1) { 
    remini bans $+ $network $+ .ini $chan
    remini bans2 $+ $network $+ .ini $chan
    remini bans3 $+ $network $+ .ini $chan
    Notice $nick All bans removed.
  }
  else { notice $nick You lack access to $chan $+ .
  }
}
on *:TEXT:$delban *:*: {
  whois $Nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, bans) || %god [ $+ [ %auth ] ] == 1) { 
    whois $2
    remini bans $+ $network $+ .ini $chan $2
    remini bans $+ $network $+ .ini $chan $address($2,2)
    notice $nick $2 Is unbanned from $chan $+ .
    mode $chan -b $2
    mode $chan -b $address($2,2)
  }
  else { notice $nick You lack access to $chan $+ .
  }
}
on *:TEXT:$uba:#: {
  whois $Nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, bans) || %god [ $+ [ %auth ] ] == 1) { 
    mode $chan -b *!*@*
  }
  else { notice $nick You lack access to $chan $+ .
  }
}

on *:TEXT:$kb *:*: {
  whois $Nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, bans) || %god [ $+ [ %auth ] ] == 1) { 
    whois $2
    writeini bans $+ $network $+ .ini $chan $address($2,2) $address($2,2)
    writeini bans3 $+ $network $+ .ini $chan $address($2,2) $nick
    mode $chan +b $address($2,2)
    kick $chan $2 Kickbanned by $nick ( $+ $3- $+ )
    writeini bans2 $+ $network $+ .ini $chan $address($2,2) $3-
  }
  else { notice $nick You lack access to $chan $+ .
  }
}
on *:TEXT:$kickban *:*: {
  whois $Nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, bans) || %god [ $+ [ %auth ] ] == 1) { 
    whois $2
    writeini bans $+ $network $+ .ini $chan $address($2,2) $address($2,2)
    writeini bans3 $+ $network $+ .ini $chan $address($2,2) $nick
    mode $chan +b $address($2,2)
    kick $chan $2 Kickbanned by $nick ( $+ $3- $+ )
    writeini bans2 $+ $network $+ .ini $chan $address($2,2) $3-
  }
  else { notice $nick You lack access to $chan $+ .
  }
}
