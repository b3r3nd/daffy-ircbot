on *:text:$ma:#: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  notice $nick Your access in all channels.
  notice $nick Access               Channel
  var %c 0
  var %t $ini(ma.ini, [ [ %auth ] ] $+ 500, 0)
  while (%c < %t) { 
    inc %c
    notice $nick 500                      $readini(ma.ini, [ [ %auth ] ] $+ 500, $ini(ma.ini, [ [ %auth ] ] $+ 500, %c))
  }
  var %c 0
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %t $ini(ma.ini, [ [ %auth ] ] $+ 400, 0)
  while (%c < %t) { 
    inc %c
    notice $nick 400                      $readini(ma.ini, [ [ %auth ] ] $+ 300, $ini(ma.ini, [ [ %auth ] ] $+ 400, %c))
  }
  var %c 0
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %t $ini(ma.ini, [ [ %auth ] ] $+ 300, 0)
  while (%c < %t) { 
    inc %c
    notice $nick 300                      $readini(ma.ini, [ [ %auth ] ] $+ 300, $ini(ma.ini, [ [ %auth ] ] $+ 300, %c))
  }
  var %c 0
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %t $ini(ma.ini, [ [ %auth ] ] $+ 200, 0)
  while (%c < %t) { 
    inc %c
    notice $nick 200                      $readini(ma.ini, [ [ %auth ] ] $+ 200, $ini(ma.ini, [ [ %auth ] ] $+ 200, %c))
  }
  var %c 0
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %t $ini(ma.ini, [ [ %auth ] ] $+ 100, 0)
  while (%c < %t) { 
    inc %c
    notice $nick 100                      $readini(ma.ini, [ [ %auth ] ] $+ 100, $ini(ma.ini, [ [ %auth ] ] $+ 100, %c))
  }
}
on *:text:$ma *:*: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(admins.ini, 800, [ $+ [ %auth ] $+ ])) { 
    whois $2
    var %auth $readini(dafauth.ini, nicks, $2)
    notice $nick $2 $+ 's access in all channels.
    notice $nick Access               Channel
    var %c 0
    var %t $ini(ma.ini, [ [ %auth ] ] $+ 500, 0)
    while (%c < %t) { 
      inc %c
      notice $nick 500                      $readini(ma.ini, [ [ %auth ] ] $+ 500, $ini(ma.ini, [ [ %auth ] ] $+ 500, %c))
    }
    var %c 0
    var %auth $readini(dafauth.ini, nicks, $2)
    var %t $ini(ma.ini, [ [ %auth ] ] $+ 400, 0)
    while (%c < %t) { 
      inc %c
      notice $nick 400                      $readini(ma.ini, [ [ %auth ] ] $+ 400, $ini(ma.ini, [ [ %auth ] ] $+ 400, %c))
    }
    var %c 0
    var %auth $readini(dafauth.ini, nicks, $2)
    var %t $ini(ma.ini, [ [ %auth ] ] $+ 300, 0)
    while (%c < %t) { 
      inc %c
      notice $nick 300                      $readini(ma.ini, [ [ %auth ] ] $+ 300, $ini(ma.ini, [ [ %auth ] ] $+ 300, %c))
    }
    var %c 0
    var %auth $readini(dafauth.ini, nicks, $2)
    var %t $ini(ma.ini, [ [ %auth ] ] $+ 200, 0)
    while (%c < %t) { 
      inc %c
      notice $nick 200                      $readini(ma.ini, [ [ %auth ] ] $+ 200, $ini(ma.ini, [ [ %auth ] ] $+ 200, %c))
    }
    var %c 0
    var %auth $readini(dafauth.ini, nicks, $2)
    var %t $ini(ma.ini, [ [ %auth ] ] $+ 100, 0)
    while (%c < %t) { 
      inc %c
      notice $nick 100                      $readini(ma.ini, [ [ %auth ] ] $+ 100, $ini(ma.ini, [ [ %auth ] ] $+ 100, %c))
    }
  }
  else { notice $Nick You need oaccess 800 for this command
  }
}
