on *:text:$god:#: {
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(admins.ini, 800, [ $+ [ %auth ] $+ ])) { 
    if (%god [ $+ [ %auth ] ] == 1) { 
      unset %god [ $+ [ %auth ] ]
      notice $nick God Disabled. 
      var %a [
      var %b ]
      msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 800 $+ %b $1 $+ :disabled
      HALT
    }
    if (!%god [ $+ [ %auth ] ]) { 
      set %god [ $+ [ %auth ] ] 1
      notice $nick God Enabled. 
      var %a [
      var %b ]
      msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 800 $+ %b $1 $+ :enabled
    }
  }
  else { notice $nick You need bot access: 800 For this command. }
}
on *:TEXT:$channels:#: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(admins.ini, 700, [ $+ [ %auth ] $+ ])) {
    notice $Nick Channel                       Owner                       Registred by 
    var %c 0
    var %t $ini(channels.ini, channels, 0)
    while (%c < %t) {
      inc %c
      set %h $readini(channels.ini, channels, $ini(channels.ini, channels, %c))
      Notice $Nick $readini(channels.ini, channels, $ini(channels.ini, channels, %c))                       $readini(channels.ini, owner, [ [ %h ] ])                       $readini(channels.ini, Reg, [ [ %h ] ])
    }      
    notice $nick End of Channels Found %c  Channels.
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 700 $+ %b $1 $+ :Registred channels
  }
  else { 
    notice $nick You Need bot access: 700 For this command.
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 700 $+ %b %a $+ Lack access $+ %b $1 $+ :Registred channels
  }
}
on *:TEXT:$reg *:*: {
  whois $nick
  whois $3
  set %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(admins.ini, 700, [ $+ [ %auth ] $+ ])) { 
    writeini users $+ $network $+ .ini $2 $+ 500 $3 $3
    writeini users $+ $network $+ .ini $2 $+ users $3 $3
    writeini users $+ $network $+ .ini $2 $+ access $3 500
    notice $nick Channel $2 Added with owner: $3 $+ .
    join $2
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 700 $+ %b $1 $+ :Register channel $2-
    writeini ma.ini $3 $+ 500 $2 $2
    writeini set $+ $network $+ .ini $2 giveops 300
    writeini set $+ $network $+ .ini $2 Givevoice 100
    writeini set $+ $network $+ .ini $2 Setters 500
    writeini set $+ $network $+ .ini $2 Userscript 300
    writeini set $+ $network $+ .ini $2 Uset 100
    writeini set $+ $network $+ .ini $2 Protect 0
    writeini set $+ $network $+ .ini $2 Autovoice 0
    writeini set $+ $network $+ .ini $2 inviteme 100
    writeini set $+ $network $+ .ini $2 Bans 300
    writeini set $+ $network $+ .ini $2 Enfops 400
    writeini set $+ $network $+ .ini $2 Enfvoice 100
    writeini channels.ini channels $2 $2
    writeini channels.ini Owner $2 $3
    writeini channels.ini Reg $2 %auth
  }
  else { 
    notice $nick You Need bot access: 700 For this command.
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 700 $+ %b %a $+ Lack access $+ %b $1 $+ :Register Channel $2-
  }
}
on *:TEXT:$unreg *:*: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(admins.ini, 700, [ $+ [ %auth ] $+ ])) { 
    var %c 0
    var %t 1000
    while (%c < %t) {
      inc %c
      remini ma.ini $readini(users.ini, $2 $+ 500, $ini(users.ini, $2 $+ 500, %c)) $+ 500 $2
      remini ma.ini $readini(users.ini, $2 $+ 400, $ini(users.ini, $2 $+ 400, %c)) $+ 400 $2
      remini ma.ini $readini(users.ini, $2 $+ 300, $ini(users.ini, $2 $+ 300, %c)) $+ 300 $2
      remini ma.ini $readini(users.ini, $2 $+ 200, $ini(users.ini, $2 $+ 200, %c)) $+ 200 $2
      remini ma.ini $readini(users.ini, $2 $+ 100, $ini(users.ini, $2 $+ 100, %c)) $+ 100 $2
    }
    remini users $+ $network $+ .ini $2 $+ 500
    remini users $+ $network $+ .ini $2 $+ 400
    remini users $+ $network $+ .ini $2 $+ 300
    remini users $+ $network $+ .ini $2 $+ 200
    remini users $+ $network $+ .ini $2 $+ 100
    remini users $+ $network $+ .ini $2 $+ users
    remini users $+ $network $+ .ini $2 $+ access
    remini set $+ $network $+ .ini $2
    remini channels.ini channels $2
    notice $nick Channel $2 Deleted.
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 700 $+ %b $1 $+ :Unregister channel $2-
  }
  else { 
    notice $nick You Need bot access: 700 For this command.
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 700 $+ %b %a $+ Lack access $+ %b $1 $+ :Unregister Channel $2-
  }
}
on *:TEXT:$simul *:*: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(admins.ini, 1000, [ $+ [ %auth ] $+ ])) { 
    if ($2 == $Me) {
      $3-
      set %a [
      set %b ]
      msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 1000 $+ %b $1 $+ :Do $2-
    }
  }
  else { 
    notice $nick You Need bot access: 1000 For this command.
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 1000 $+ %b %a $+ Lack access $+ %b $1 $+ :Do $2-
  }
}
on *:TEXT:$do *:*: {
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(admins.ini, 1000, [ $+ [ %auth ] $+ ])) { 
    $2-
  }
  else { 
    notice $nick You Need bot access: 1000 For this command.
  }
}
on *:TEXT:$slap *:*: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(admins.ini, 500, [ $+ [ %auth ] $+ ])) { 
    describe # slaps $2 $+ !!
  }
  else { Describe # slaps $nick :o
  }
}
on *:TEXT:$slap:#: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(admins.ini, 500, [ $+ [ %auth ] $+ ])) { 
    msg # Slap you? no sweetie not you.. <3
  }
  else { Describe # slaps $nick 
  }
}
on *:TEXT:$kiss:#: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(admins.ini, 500, [ $+ [ %auth ] $+ ])) { 
    describe # kisses $nick :*
  }
  else { Describe # slaps $nick :o
  }
}
on *:TEXT:$love:#: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(admins.ini, 500, [ $+ [ %auth ] $+ ])) { 
    describe # kisses $nick <3
  }
  else { Describe # slaps $nick :o
  }
}
on *:TEXT:$kiss *:*: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(admins.ini, 500, [ $+ [ %auth ] $+ ])) { 
    describe # kisses $2  
  }
  else { Describe # slaps $nick :o
  }
}
on *:TEXT:$love *:*: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(admins.ini, 500, [ $+ [ %auth ] $+ ])) { 
    describe # loves $2 <3
  }
  else { Describe # slaps $nick :o
  }
}
on *:TEXT:$nick *:*: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(admins.ini, 800, [ $+ [ %auth ] $+ ])) { 
    nick $2   
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 800 $+ %b $1 $+ :Nick $2-
  }
  else { 
    notice $nick You Need bot access: 800 For this command.
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 800 $+ %b %a $+ Lack access $+ %b $1 $+ :Nick $2-
  }
}
on *:TEXT:$say *:*: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(admins.ini, 600, [ $+ [ %auth ] $+ ])) { 
    msg $chan $$2- 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 600 $+ %b $1 $+ :Nick $2-
  }
  else { 
    notice $nick You Need bot access: 500 For this command.
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 600 $+ %b %a $+ Lack access $+ %b $1 $+ :Say $2-   

  }
}
on *:TEXT:$emote *:*: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(admins.ini, 600, [ $+ [ %auth ] $+ ])) { 
    describe $chan $$2-    
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 600 $+ %b $1 $+ :Emote $2-
  }
  else { 
    notice $nick You Need bot access: 500 For this command.
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 600 $+ %b %a $+ Lack access $+ %b $1 $+ :Emote $2-
  }
}
on *:TEXT:$part:#: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(admins.ini, 600, [ $+ [ %auth ] $+ ])) { 
    part $chan Destroyed by $nick
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 600 $+ %b $1 $+ :Part $2-
  }
  else { 
    notice $nick You Need bot access: 600 For this command.
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 600 $+ %b %a $+ Lack access $+ %b $1 $+ :Part $2-
  }
}
on *:TEXT:$part *:*: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(admins.ini, 600, [ $+ [ %auth ] $+ ])) { 
    part $2 Destroyed by $nick
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 600 $+ %b $1 $+ :Part $2-
  }
  else { 
    notice $nick You Need bot access: 600 For this command.
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 600 $+ %b %a $+ Lack access $+ %b $1 $+ :Part $2-
  }
}
on *:TEXT:$join *:*: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(admins.ini, 600, [ $+ [ %auth ] $+ ])) { 
    join $2 
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 600 $+ %b $1 $+ :Join $2-  
  }
  else { 
    notice $nick You Need bot access: 600 For this command.
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 600 $+ %b %a $+ Lack access $+ %b $1 $+ :Join $2-
  }
}
on *:TEXT:$adminclvl *:*: {
  whois $nick 
  var %auth $readini(dafauth.ini, auths, $nick)
  if ($readini(admins.ini, 1000, [ $+ [ %auth ] $+ ])) { 
    if ($2 == berend) { notice $Nick You cant clvl my boss. }
    if ($3 == 1000) {
      writeini admins.ini admins $2 $2
      writeini admins.ini admins2 $2 $3
      writeini admins.ini 1000 $2 $2
      writeini admins.ini 900 $2 $2
      writeini admins.ini 800 $2 $2
      writeini admins.ini 700 $2 $2
      writeini admins.ini 600 $2 $2
      writeini admins.ini 500 $2 $2
      notice $nick Admin $2 added in level 500-1000.
      set %a [
      set %b ]
      msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 1000 $+ %b $1 $+ :Admin Clvl $2-
    }
    if ($3 == 900) {
      remini admins.ini 1000 $2
      writeini admins.ini admins $2 $2
      writeini admins.ini admins2 $2 $3
      writeini admins.ini 900 $2 $2
      writeini admins.ini 800 $2 $2
      writeini admins.ini 700 $2 $2
      writeini admins.ini 600 $2 $2
      writeini admins.ini 500 $2 $2
      notice $nick Admin $2 added in level 500-900.
      set %a [
      set %b ]
      msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 1000 $+ %b $1 $+ :Admin Clvl $2-
    }
    if ($3 == 800) {
      remini admins.ini 1000 $2
      remini admins.ini 900 $2
      writeini admins.ini admins $2 $2
      writeini admins.ini admins2 $2 $3
      writeini admins.ini 800 $2 $2
      writeini admins.ini 700 $2 $2
      writeini admins.ini 600 $2 $2
      writeini admins.ini 500 $2 $2
      notice $nick Admin $2 added in level 500-800.
      set %a [
      set %b ]
      msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 1000 $+ %b $1 $+ :Admin Clvl $2-
    }
    if ($3 == 700) {
      remini admins.ini 1000 $2
      remini admins.ini 900 $2
      remini admins.ini 800 $2
      writeini admins.ini admins $2 $2
      writeini admins.ini admins2 $2 $3
      writeini admins.ini 700 $2 $2
      writeini admins.ini 600 $2 $2
      writeini admins.ini 500 $2 $2
      notice $nick Admin $2 added in level 500-700.
      set %a [
      set %b ]
      msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 1000 $+ %b $1 $+ :Admin Clvl $2-
    }
    if ($3 == 600) {
      remini admins.ini 1000 $2
      remini admins.ini 900 $2
      remini admins.ini 800 $2
      remini admins.ini 700 $2
      writeini admins.ini admins $2 $2
      writeini admins.ini admins2 $2 $3
      writeini admins.ini 600 $2 $2
      writeini admins.ini 500 $2 $2
      notice $nick Admin $2 added in level 500-600.
      set %a [
      set %b ]
      msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 1000 $+ %b $1 $+ :Admin Clvl $2-
    }
    if ($3 == 500) {
      remini admins.ini 1000 $2
      remini admins.ini 900 $2
      remini admins.ini 800 $2
      remini admins.ini 700 $2
      remini admins.ini 600 $2
      writeini admins.ini admins $2 $2
      writeini admins.ini admins2 $2 $3
      writeini admins.ini 500 $2 $2
      notice $nick Admin $2 added in level 500-500.
      set %a [
      set %b ]
      msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 1000 $+ %b $1 $+ :Admin Clvl $2-
    }
  }
  else { 
    notice $nick You Need bot access: 1000 For this command.
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 1000 $+ %b %a $+ Lack access $+ %b $1 $+ :Admin Clvl $2-
  }
}
on *:TEXT:$addadmin *:*: {
  whois $nick 
  var %auth $readini(dafauth.ini, auths, $nick)
  if ($readini(admins.ini, 1000, [ $+ [ %auth ] $+ ])) { 
    if ($3 == 1000) {
      writeini admins.ini admins $2 $2
      writeini admins.ini admins2 $2 $3
      writeini admins.ini 1000 $2 $2
      writeini admins.ini 900 $2 $2
      writeini admins.ini 800 $2 $2
      writeini admins.ini 700 $2 $2
      writeini admins.ini 600 $2 $2
      writeini admins.ini 500 $2 $2
      notice $nick Admin $2 added in level 500-1000.
      set %a [
      set %b ]
      msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 1000 $+ %b $1 $+ :Admin add $2-
    }
    if ($3 == 900) {
      writeini admins.ini admins $2 $2
      writeini admins.ini admins2 $2 $3
      writeini admins.ini 900 $2 $2
      writeini admins.ini 800 $2 $2
      writeini admins.ini 700 $2 $2
      writeini admins.ini 600 $2 $2
      writeini admins.ini 500 $2 $2
      notice $nick Admin $2 added in level 500-900.
      set %a [
      set %b ]
      msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 1000 $+ %b $1 $+ :Admin add $2-
    }
    if ($3 == 800) {
      writeini admins.ini admins $2 $2
      writeini admins.ini admins2 $2 $3
      writeini admins.ini 800 $2 $2
      writeini admins.ini 700 $2 $2
      writeini admins.ini 600 $2 $2
      writeini admins.ini 500 $2 $2
      notice $nick Admin $2 added in level 500-800.
      set %a [
      set %b ]
      msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 1000 $+ %b $1 $+ :Admin add $2-
    }
    if ($3 == 700) {
      writeini admins.ini admins $2 $2
      writeini admins.ini admins2 $2 $3
      writeini admins.ini 700 $2 $2
      writeini admins.ini 600 $2 $2
      writeini admins.ini 500 $2 $2
      notice $nick Admin $2 added in level 500-700.
      set %a [
      set %b ]
      msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 1000 $+ %b $1 $+ :Admin add $2-
    }
    if ($3 == 600) {
      writeini admins.ini admins $2 $2
      writeini admins.ini admins2 $2 $3
      writeini admins.ini 600 $2 $2
      writeini admins.ini 500 $2 $2
      notice $nick Admin $2 added in level 500-600.
      set %a [
      set %b ]
      msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 1000 $+ %b $1 $+ :Admin add $2-
    }
    if ($3 == 500) {
      writeini admins.ini admins $2 $2
      writeini admins.ini admins2 $2 $3
      writeini admins.ini 500 $2 $2
      notice $nick Admin $2 added in level 500-500.
      set %a [
      set %b ]
      msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 1000 $+ %b $1 $+ :Admin add $2-
    }
  }  
  else { 
    notice $nick You Need bot access: 1000 For this command.
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 1000 $+ %b %a $+ Lack access $+ %b $1 $+ :Admin add $2-
  }
}
on *:TEXT:$deladmin *:*: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(admins.ini, 1000, [ $+ [ %auth ] $+ ])) {
    if ($2 == berend) { notice $Nick You cant Delete my boss. } 
    remini admins.ini admins2 $2   
    remini admins.ini admins $2
    remini admins.ini 500 $2
    remini admins.ini 600 $2
    remini admins.ini 700 $2
    remini admins.ini 800 $2
    remini admins.ini 900 $2
    remini admins.ini 1000 $2
    notice $nick Admin: $2 Delted.
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 1000 $+ %b $1 $+ :Admin del $2-
  }  
  else { 
    notice $nick You Need bot access: 1000 For this command.
    set %a [
    set %b ]
    msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 1000 $+ %b %a $+ Lack access $+ %b $1 $+ :Admin del $2-
  }
}
on *:TEXT:$oa:#: {
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(admins.ini, admins, [ $+ [ %auth ] $+ ])) {
    notice $nick You Have $readini(admins.ini, admins2, [ $+ [ %auth ] $+ ]) oaccess.
  }
  else {
    notice $nick You dont have admin access to Daffy
  }
  set %a [
  set %b ]
  msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 0 $+ %b $1 $+ :Oaccess $2-
}
on *:TEXT:$oa *:*: {
  var %auth2 $readini(dafauth.ini, nicks, $2)
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(admins.ini, admins, [ $+ [ %auth2 ] $+ ])) {
    notice $nick  $+ $2 Has $readini(admins.ini, admins2, [ $+ [ %auth2 ] $+ ]) oaccess.
  }
  else {
    notice $nick $2 doesn't have admin access to Daffy
  }
  set %a [
  set %b ]
  msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 0 $+ %b $1 $+ :Oaccess $2-
}
on *:TEXT:$admins:#: {
  notice $nick Daffy's Admin(s):
  notice $nick 1000             berend
  notice $nick End of Admins.
  set %a [
  set %b ]
  var %auth $readini(dafauth.ini, nicks, $nick)
  msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 0 $+ %b $1 $+ :Admins $2-
}
