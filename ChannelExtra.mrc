on *:text:$va:#: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, Enfvoice) || %god [ $+ [ %auth ] ] == 1) {
    set %c 0
    set %d 1
    set %e 2
    set %f 3
    set %g 4
    set %t $nick($chan, 0)
    while (%c < %t) { 
      mode # +vvvvv $nick($chan, [ [ %c ] ]) $nick($chan, [ [ %d ] ]) $nick($chan, [ [ %e ] ]) $nick($chan, [ [ %f ] ]) $nick($chan, [ [ %g ] ])
      inc %c 5
      inc %d 5
      inc %e 5
      inc %f 5
      inc %g 5
    }
  }
}
on *:text:$dva:#: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, Enfvoice) || %god [ $+ [ %auth ] ] == 1) {
    set %c 0
    set %d 1
    set %e 2
    set %f 3
    set %g 4
    set %t $nick($chan, 0)
    while (%c < %t) { 
      if ($nick($chan, [ [ %c ] ]) == $me) {
        mode # -vvvv $nick($chan, [ [ %d ] ]) $nick($chan, [ [ %e ] ]) $nick($chan, [ [ %f ] ]) $nick($chan, [ [ %g ] ])
        inc %c 5
        inc %d 5
        inc %e 5
        inc %f 5
        inc %g 5
      } 
      if ($nick($chan, [ [ %d ] ]) == $me) {
        mode # -vvvv $nick($chan, [ [ %c ] ]) $nick($chan, [ [ %e ] ]) $nick($chan, [ [ %f ] ]) $nick($chan, [ [ %g ] ])
        inc %c 5
        inc %d 5
        inc %e 5
        inc %f 5
        inc %g 5
      } 
      if ($nick($chan, [ [ %e ] ]) == $me) {
        mode # -vvvv $nick($chan, [ [ %c ] ]) $nick($chan, [ [ %d ] ]) $nick($chan, [ [ %f ] ]) $nick($chan, [ [ %g ] ])
        inc %c 5
        inc %d 5
        inc %e 5
        inc %f 5
        inc %g 5
      } 
      if ($nick($chan, [ [ %f ] ]) == $me) {
        mode # -vvvv $nick($chan, [ [ %c ] ]) $nick($chan, [ [ %d ] ]) $nick($chan, [ [ %f ] ]) $nick($chan, [ [ %g ] ])
        inc %c 5
        inc %d 5
        inc %e 5
        inc %f 5
        inc %g 5
      } 
      if ($nick($chan, [ [ %g ] ]) == $me) {
        mode # -vvvv $nick($chan, [ [ %c ] ]) $nick($chan, [ [ %d ] ]) $nick($chan, [ [ %e ] ]) $nick($chan, [ [ %f ] ])
        inc %c 5
        inc %d 5
        inc %e 5
        inc %f 5
        inc %g 5
      } 
      if ($nick($chan, [ [ %c ] ]) != $me && $nick($chan, [ [ %d ] ]) != $me && $nick($chan, [ [ %e ] ]) != $me && $nick($chan, [ [ %f ] ]) != $me && $nick($chan, [ [ %g ] ]) != $me) {
        echo ELSE $nick($chan, [ [ %c ] ]) $nick($chan, [ [ %d ] ]) $nick($chan, [ [ %e ] ]) $nick($chan, [ [ %f ] ]) $nick($chan, [ [ %g ] ])
        mode # -vvvvv $nick($chan, [ [ %c ] ]) $nick($chan, [ [ %d ] ]) $nick($chan, [ [ %e ] ]) $nick($chan, [ [ %f ] ]) $nick($chan, [ [ %g ] ]) 
        inc %c 5
        inc %d 5
        inc %e 5
        inc %f 5
        inc %g 5
      }
    }
  }
}
on *:text:$opa:#: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, Enfvoice) || %god [ $+ [ %auth ] ] == 1) {
    set %c 0
    set %d 1
    set %e 2
    set %f 3
    set %g 4
    set %t $nick($chan, 0)
    while (%c < %t) { 
      mode # +ooooo $nick($chan, [ [ %c ] ]) $nick($chan, [ [ %d ] ]) $nick($chan, [ [ %e ] ]) $nick($chan, [ [ %f ] ]) $nick($chan, [ [ %g ] ])
      inc %c 5
      inc %d 5
      inc %e 5
      inc %f 5
      inc %g 5
    }
  }
}
on *:text:$dpa:#: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, Enfvoice) || %god [ $+ [ %auth ] ] == 1) {
    set %c 0
    set %d 1
    set %e 2
    set %f 3
    set %g 4
    set %t $nick($chan, 0)
    while (%c < %t) { 
      if ($nick($chan, [ [ %c ] ]) == $me) {
        mode # -oooo $nick($chan, [ [ %d ] ]) $nick($chan, [ [ %e ] ]) $nick($chan, [ [ %f ] ]) $nick($chan, [ [ %g ] ])
        inc %c 5
        inc %d 5
        inc %e 5
        inc %f 5
        inc %g 5
      } 
      if ($nick($chan, [ [ %d ] ]) == $me) {
        mode # -oooo $nick($chan, [ [ %c ] ]) $nick($chan, [ [ %e ] ]) $nick($chan, [ [ %f ] ]) $nick($chan, [ [ %g ] ])
        inc %c 5
        inc %d 5
        inc %e 5
        inc %f 5
        inc %g 5
      } 
      if ($nick($chan, [ [ %e ] ]) == $me) {
        mode # -oooo $nick($chan, [ [ %c ] ]) $nick($chan, [ [ %d ] ]) $nick($chan, [ [ %f ] ]) $nick($chan, [ [ %g ] ])
        inc %c 5
        inc %d 5
        inc %e 5
        inc %f 5
        inc %g 5
      } 
      if ($nick($chan, [ [ %f ] ]) == $me) {
        mode # -oooo $nick($chan, [ [ %c ] ]) $nick($chan, [ [ %d ] ]) $nick($chan, [ [ %f ] ]) $nick($chan, [ [ %g ] ])
        inc %c 5
        inc %d 5
        inc %e 5
        inc %f 5
        inc %g 5
      } 
      if ($nick($chan, [ [ %g ] ]) == $me) {
        mode # -oooo $nick($chan, [ [ %c ] ]) $nick($chan, [ [ %d ] ]) $nick($chan, [ [ %e ] ]) $nick($chan, [ [ %f ] ])
        inc %c 5
        inc %d 5
        inc %e 5
        inc %f 5
        inc %g 5
      } 
      if ($nick($chan, [ [ %c ] ]) != $me && $nick($chan, [ [ %d ] ]) != $me && $nick($chan, [ [ %e ] ]) != $me && $nick($chan, [ [ %f ] ]) != $me && $nick($chan, [ [ %g ] ]) != $me) {
        echo ELSE $nick($chan, [ [ %c ] ]) $nick($chan, [ [ %d ] ]) $nick($chan, [ [ %e ] ]) $nick($chan, [ [ %f ] ]) $nick($chan, [ [ %g ] ])
        mode # -ooooo $nick($chan, [ [ %c ] ]) $nick($chan, [ [ %d ] ]) $nick($chan, [ [ %e ] ]) $nick($chan, [ [ %f ] ]) $nick($chan, [ [ %g ] ]) 
        inc %c 5
        inc %d 5
        inc %e 5
        inc %f 5
        inc %g 5
      }
    }
  }
}
on *:text:$op *:*: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, EnfOps) || %god [ $+ [ %auth ] ] == 1) {
    mode # +ooooo $2 $3 $4 $5 $6
    mode # +ooooo $$7 $8 $9 $10 $11
    mode # +ooooo $$12 $13 $14 $15 $16
    mode # +ooooo $$17 $18 $19 $20 $21
    notice $nick Opped: $2-
  }
  else { notice $nick You lack access to $chan $+ . }
}
on *:text:$deop *:*: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, Enfops) || %god [ $+ [ %auth ] ] == 1) {
    mode # -ooooo $2 $3 $4 $5 $6
    mode # -ooooo $$7 $8 $9 $10 $11
    mode # -ooooo $$12 $13 $14 $15 $16
    mode # -ooooo $$17 $18 $19 $20 $21
    notice $Nick Deopped: $2-
  }
  else { notice $nick You lack access to $chan $+ . }
}
on *:text:$voice *:*: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, Enfvoice) || %god [ $+ [ %auth ] ] == 1) {
    mode # +vvvvv $2 $3 $4 $5 $6
    mode # +vvvvv $$7 $8 $9 $10 $11
    mode # +vvvvv $$12 $13 $14 $15 $16
    mode # +vvvvv $$17 $18 $19 $20 $21
    notice $Nick Voiced: $2-
  }
  else { notice $nick You lack access to $chan $+ . }
}
on *:text:$devoice *:*: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if (%access >= $readini(set $+ $network $+ .ini, $chan, Enfvoice) || %god [ $+ [ %auth ] ] == 1) {
    mode # -vvvvv $2 $3 $4 $5 $6
    mode # -vvvvv $$7 $8 $9 $10 $11
    mode # -vvvvv $$12 $13 $14 $15 $16
    mode # -vvvvv $$17 $18 $19 $20 $21
    notice $Nick Devoiced: $2-
  }
  else { notice $nick You lack access to $chan $+ . }
}
