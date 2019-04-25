on *:TEXT:$doall *:*: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(helpserv.ini, admins, [ $+ [ %auth ] ])) {
    $2-
  }
  else { 
    notice $nick You Need Admin Class to use this command.
  }
}
on *:TEXT:$sayall *:*: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(helpserv.ini, admins, [ $+ [ %auth ] ]) || $readini(helpserv.ini, supporters, [ $+ [ %auth ] ])) {
    msg $chan $$2- 
  }
  else { 
    notice $nick You Need Supporter Class to use this command.
  }
}
on *:TEXT:$emoteall *:*: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(helpserv.ini, admins, [ $+ [ %auth ] ]) || $readini(helpserv.ini, supporters, [ $+ [ %auth ] ])) {
    describe $chan $$2-    
  }
  else { 
    notice $nick You Need Supporter Class to use this command.
  }
}
on *:TEXT:$partall:#: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(helpserv.ini, admins, [ $+ [ %auth ] ]) || $readini(helpserv.ini, supporters, [ $+ [ %auth ] ])) {
    part $chan Destroyed by $nick
  }
  else { 
    notice $nick You Need Supporter Class to use this command.
  }
}
on *:TEXT:$partall *:*: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(helpserv.ini, admins, [ $+ [ %auth ] ]) || $readini(helpserv.ini, supporters, [ $+ [ %auth ] ])) {
    part $2 Destroyed by $nick
  }
  else { 
    notice $nick You Need Supporter Class to use this command.
  }
}
on *:TEXT:$joinall *:*: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(helpserv.ini, admins, [ $+ [ %auth ] ]) || $readini(helpserv.ini, supporters, [ $+ [ %auth ] ])) {
    join $2 
  }
  else { 
    notice $nick You Need Supporter Class to use this command.
  }
}
