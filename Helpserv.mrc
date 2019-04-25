
on *:join:#HelpServ: {
  if ($nick == $me) { HALT }
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(helpserv.ini, admins, [ $+ [ %auth ] ]) || $readini(helpserv.ini, supporters, [ $+ [ %auth ] ])) { inc %So 1 | msg #abcdtest2 $nick is het #HelpServ kanaal binnengekomen er zijn nu %so Helpers beschrikbaar. | HALT }
  else {
    inc %Re 1
    msg #helpserv.overwatch $nick is het #HelpServ kanaal binnengekomen. Er zijn %So helpers beschrikbaar. Aanvraag %Re $+ .
    notice $nick Welkom in het help kanaal. je nummer is %re Wacht op je beurt.
    writeini helpserv.ini aanvraag %re $nick
    writeini helpserv.ini aanvraag $nick %re
    writeini helpserv.ini free %re $nick
    writeini helpserv.ini free $nick %re 
    writeini aanvragen.ini Aanvraag $nick %re
    writeini aanvragen.ini Aanvraag2 %re $nick
  }
}

on *:text:@version:#: {
  notice $nick Daffy. Duffy, Doffy IRCbots. Scripted by berend.
  Notice $nick Scripted in the mIRC Scripting Language (mSL) For Bugs reports. Or bot requests join #berend
  notice $Nick Daffy - Channel management bot. Uses trigger $. Write $ $+ help for more info.
  notice $Nick Doffy - Helpserv bot. You can not use this bot most of the time. But the trigger is @ en write @help for more info.
  notice $Nick Duffy - Funbot. Uses trigger !. For more info use !Help.
  notice $nick If you have any other questions you can just come into my channel. Or /query berend
  notice $Nick End of Version $+ .
}
on *:text:@help:#: {
  notice $Nick Doffy IRCbot, mSL scripted by berend ( $+ #berend $+ )
  notice $nick Helpserv                               Help with the Helpserv bot..
  notice $nick HelpservAdmin                    Help admin commands from the helpserv.
  notice $Nick End of Help commands Doffy.
}
on *:text:@help *:*: {
  if ($2 == helpserv) {
    notice $nick Helpserv Commands Doffy
    notice $nick Next                                       Takes the next user waiting.
    notice $nick Pickup                                   Pick up the user with the nickname or number you want.
    notice $nick Drop                                       Drop's the user with the nickname or number you want.
    notice $nick Done                                      Drop's request currently working on.
    notice $nick Aanvragen                            Show the requests, with number and nickname.
    notice $Nick End of Helpserv commands Doffy.
  }
  if ($2 == HelpservAdmin) {
    notice $nick Admin Commands Doffy
    notice $Nick Admin       -       Addmember
    notice $Nick Admin       -       Delmember
    notice $Nick Admin       -       Members
    notice $Nick Admin       -       a
    notice $Nick End of Admins commands Doffy.
  }
}

on *:part:#HelpServ: {
  if ($nick == $me) { HALT }
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(helpserv.ini, admins, [ $+ [ %auth ] ]) || $readini(helpserv.ini, supporters, [ $+ [ %auth ] ])) { dec %So 1 | msg #abcdtest2 $nick heeft het #HelpServ kanaal verlaten er zijn nu %so Helpers beschrikbaar. | HALT }
  else {
    set %hnummer $readini(helpserv.ini, aanvraag, $nick)
    remini helpserv.ini free %hnummer
    remini helpserv.ini free $nick
    remini helpserv.ini bezig %hnummer
    remini helpserv.ini bezig $nick
    remini helpserv.ini aanvraag %hnummer
    remini helpserv.ini aanvraag $nick
    remini aanvragen.ini Aanvraag $nick 
    remini aanvragen.ini Aanvraag2 %hnummer
    msg #helpserv.overwatch $nick heeft het #HelpServ kanaal verlaten. Er zijn %So helpers beschrikbaar. zijn Aanvraag is gedropt.
    notice $nick Je hebt het #HelpServ kanaal verlaten. je aanvraag is verloren gegaan.
  }
}
on *:nick: {
  whois $newnick
  var %auth $readini(dafauth.ini, nicks, $newnick)
  if (!$readini(helpserv.ini, admins, [ $+ [ %auth ] ]) || $readini(helpserv.ini, supporters, [ $+ [ %auth ] ])) { 
    set %hnummer $readini(helpserv.ini, aanvraag, $nick)
    remini helpserv.ini free %hnummer
    remini helpserv.ini free $nick
    remini helpserv.ini bezig %hnummer
    remini helpserv.ini bezig $nick
    remini helpserv.ini aanvraag %hnummer
    remini helpserv.ini aanvraag $nick
    remini aanvragen.ini Aanvraag $nick 
    remini aanvragen.ini Aanvraag2 %hnummer
    writeini helpserv.ini free %hnummer $newnick
    writeini helpserv.ini free $newnick %hnummer
    writeini helpserv.ini bezig %hnummer $newnick
    writeini helpserv.ini bezig $newnick %hnummer
    writeini helpserv.ini aanvraag %hnummer $newnick
    writeini helpserv.ini aanvraag $newnick %hnummer
    writeini aanvragen.ini Aanvraag $newnick %hnummer
    writeini aanvragen.ini Aanvraag2 %hnummer $newnick
  } 
  else { halt }
}
on *:text:@pickup *:*: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(helpserv.ini, admins, [ $+ [ %auth ] ]) || $readini(helpserv.ini, supporters, [ $+ [ %auth ] ])) {
    if ($2 isnum) { 
      if ($readini(helpserv.ini, free, $2)) {
        set %hnick $readini(helpserv.ini, aanvraag, $2)
        set %hnummer $readini(helpserv.ini, aanvraag, [ $+ [ %hnick ] ])
        remini helpserv.ini free $2
        remini helpserv.ini free %hnick
        writeini helpserv.ini bezig $2 $2
        writeini helpserv.ini bezig %hnick %hnick
        remini aanvragen.ini Aanvraag %hnick
        remini aanvragen.ini Aanvraag2 $2
        notice %hnick Je aanvraag $2 is in behandeling. je hebt nu +v en kan praten.
        mode #HelpServ +v %hnick 
        msg #HelpServ.Overwatch aanvraag %hnummer - %hnick opgepakt door $nick
      }
    }
    if ($2 !isnum) { 
      if ($readini(helpserv.ini, free, $2)) {
        set %hnummer $readini(helpserv.ini, aanvraag, $2)
        set %hnick $readini(helpserv.ini, aanvraag, [ $+ [ %hnummer ] ])
        remini helpserv.ini free $2
        remini helpserv.ini free %hnick
        writeini helpserv.ini bezig $2 $2
        writeini helpserv.ini bezig %hnick %hnick
        remini aanvragen.ini Aanvraag %hnick
        remini aanvragen.ini Aanvraag2 $2
        notice %hnick Je aanvraag $2 is in behandeling. je hebt nu +v en kan praten.
        mode #HelpServ +v %hnick 
        msg #HelpServ.Overwatch aanvraag %hnummer - %hnick opgepakt door $nick
      }
    }
  }
}
on *:text:@done:#: {
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(helpserv.ini, admins, [ $+ [ %auth ] ]) || $readini(helpserv.ini, supporters, [ $+ [ %auth ] ])) {
    msg #HelpServ.Overwatch aanvraag %hnummer - %hnick gedropt door $nick
    remini helpserv.ini free %hnummer
    remini helpserv.ini free %hnick
    remini helpserv.ini bezig %hnummer
    remini helpserv.ini bezig %hnick
    remini helpserv.ini aanvraag %hnummer
    remini helpserv.ini aanvraag %hnick
    remini aanvragen.ini Aanvraag %hnick
    remini aanvragen.ini Aanvraag2 %hnummer
    notice %hnick Je aanvraag is gedropt, bedankt voor je gedult.
    mode #HelpServ -v %hnick
    kick #HelpServ %hnick Je aanvraag is gedropt
  }
}
on *:text:@next:#: {
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(helpserv.ini, admins, [ $+ [ %auth ] ]) || $readini(helpserv.ini, supporters, [ $+ [ %auth ] ])) {
    set %hnummer $ini(helpserv.ini, free, 1)
    set %hnick $readini(helpserv.ini, free, [ $+ [ %hnummer ] ])
    msg #HelpServ.Overwatch aanvraag %hnummer - %hnick opgepakt door $nick
    remini helpserv.ini free %hnummer
    remini helpserv.ini free %hnick
    writeini helpserv.ini bezig %hnummer %hnummer
    writeini helpserv.ini bezig %hnick %hnick
    remini aanvragen.ini Aanvraag %hnick
    remini aanvragen.ini Aanvraag2 %hnummer
    notice %hnick Je aanvraag %hnummer is in behandeling. je hebt nu +v en kan praten.
    mode #HelpServ +v %hnick 
  }
}
on *:text:@drop *:*: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(helpserv.ini, admins, [ $+ [ %auth ] ]) || $readini(helpserv.ini, supporters, [ $+ [ %auth ] ])) {
    if ($2 isnum) {
      set %hnick $readini(helpserv.ini, aanvraag, $2)
      set %hnummer $readini(helpserv.ini, aanvraag, [ $+ [ %hnick ] ])
      msg #HelpServ.overwatch aanvraag %hnummer - %hnick gedropt door $nick
      remini helpserv.ini free $2
      remini helpserv.ini free %hnick
      remini helpserv.ini bezig $2
      remini helpserv.ini bezig %hnick
      remini helpserv.ini aanvraag $2
      remini helpserv.ini aanvraag %hnick
      remini aanvragen.ini Aanvraag %hnick
      remini aanvragen.ini Aanvraag2 $2
      notice %hnick Je aanvraag is gedropt, bedankt voor je gedult.
      mode #HelpServ -v %hnick
      kick #HelpServ %hnick Je aanvraag is gedropt
    }
    if ($2 !isnum) {
      set %hnummer $readini(helpserv.ini, aanvraag, $2)
      set %hnick $readini(helpserv.ini, aanvraag, [ $+ [ %hnummer ] ])
      msg #helpserv.overwatch aanvraag %hnummer - %hnick gedropt door $nick
      remini helpserv.ini free $2
      remini helpserv.ini free %hnick
      remini helpserv.ini bezig $2
      remini helpserv.ini bezig %hnick
      remini helpserv.ini aanvraag $2
      remini helpserv.ini aanvraag %hnick
      remini aanvragen.ini Aanvraag %hnick
      remini aanvragen.ini Aanvraag2 $2
      notice %hnick Je aanvraag is gedropt, bedankt voor je gedult.
      mode #HelpServ -v %hnick
      kick #HelpServ %hnick Je aanvraag is gedropt
    }
  }
}
on *:text:@aanvragen:#: {
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(helpserv.ini, admins, [ $+ [ %auth ] ]) || $readini(helpserv.ini, supporters, [ $+ [ %auth ] ])) {
    notice $nick Onbehandelde aanvragen
    var %c 0
    var %t $ini(aanvragen.ini, aanvraag, 0)
    while (%c < %t) {
      inc %c
      notice $nick $readini(aanvragen.ini, aanvraag, $ini(aanvragen.ini, aanvraag, %c)) - $readini(aanvragen.ini, aanvraag2, $ini(aanvragen.ini, aanvraag2, %c))
    }
  }
}

on *:text:@addmember *:*: {
  whois $nick
  whois $2
  set %auth $readini(dafauth.ini, nicks, $nick)
  set %auth2 $readini(dafauth.ini, nicks, $3)
  if ($readini(helpserv.ini, admins, [ $+ [ %auth ] ])) {
    if ($2 == supporter) {
      writeini helpserv.ini supporters %auth2 %auth2
      notice $nick Supporter added.
    }
    if ($2 == admin) {
      writeini helpserv.ini admins %auth2 %auth2
      notice $nick admin added.
    }
  }
}
on *:text:@delmember *:*: {
  whois $nick
  whois $2
  set %auth $readini(dafauth.ini, nicks, $nick)
  set %auth2 $readini(dafauth.ini, nicks, $2)
  if ($readini(helpserv.ini, admins, [ $+ [ %auth ] ])) {
    remini helpserv.ini supporters %auth2 %auth2
    remini helpserv.ini admins %auth2 %auth2
    notice $nick Member deleted
  }
}
on *:TEXT:@a:#: { 
  whois $nick
  set %auth $readini(dafauth.ini, nicks, $nick)
  if (!$readini(helpserv.ini, admins, [ $+ [ %auth ] ]) && !$readini(helpserv.ini, supporters, [ $+ [ %auth ] ])) { notice $Nick You dont have any access. | halt }
  if ($readini(helpserv.ini, admins, [ $+ [ %auth ] ])) { notice $nick You have Admin Class. | HALT }
  if ($readini(helpserv.ini, supporters, [ $+ [ %auth ] ])) { notice $nick You have Supporter Class. | HALT }
}
on *:TEXT:@a *:*: { 
  whois $2
  set %auth $readini(dafauth.ini, nicks, $2)
  if (!$readini(helpserv.ini, admins, [ $+ [ %auth ] ]) && !$readini(helpserv.ini, supporters, [ $+ [ %auth ] ])) { notice $Nick $2 doesn't have any access. | halt }
  if ($readini(helpserv.ini, admins, [ $+ [ %auth ] ])) { notice $nick $2 Has Admin Class. | HALT }
  if ($readini(helpserv.ini, supporters, [ $+ [ %auth ] ])) { notice $nick $2 Has Supporter Class. | HALT }
}
on *:text:@members:#: {
  notice $nick Daffy Helpserv members
  var %c 0
  var %t $ini(helpserv.ini, admins, 0)
  while (%c < %t) {
    inc %c
    notice $Nick Admin                     $readini(helpserv.ini, admins, $ini(helpserv.ini, admins, %c)) 
  }
  var %c 0
  var %t $ini(helpserv.ini, supporters, 0)
  while (%c < %t) {
    inc %c
    notice $Nick Supporter               $readini(helpserv.ini, supporters, $ini(helpserv.ini, supporters, %c)) 
  }
  notice $nick End of Members
}
on *:TEXT:@do *:*: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(helpserv.ini, admins, [ $+ [ %auth ] ])) {
    $2-
  }
  else { 
    notice $nick You Need Admin Class to use this command.
  }
}
on *:TEXT:@nick *:*: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(helpserv.ini, admins, [ $+ [ %auth ] ])) {
    nick $2   
  }
  else { 
    notice $nick You Need Admin Class to use this command.
  }
}
on *:TEXT:@say *:*: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(helpserv.ini, admins, [ $+ [ %auth ] ]) || $readini(helpserv.ini, supporters, [ $+ [ %auth ] ])) {
    msg $chan $$2- 
  }
  else { 
    notice $nick You Need Supporter Class to use this command.
  }
}
on *:TEXT:@emote *:*: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(helpserv.ini, admins, [ $+ [ %auth ] ]) || $readini(helpserv.ini, supporters, [ $+ [ %auth ] ])) {
    describe $chan $$2-    
  }
  else { 
    notice $nick You Need Supporter Class to use this command.
  }
}
on *:TEXT:@part:#: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(helpserv.ini, admins, [ $+ [ %auth ] ]) || $readini(helpserv.ini, supporters, [ $+ [ %auth ] ])) {
    part $chan Destroyed by $nick
  }
  else { 
    notice $nick You Need Supporter Class to use this command.
  }
}
on *:TEXT:@part *:*: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(helpserv.ini, admins, [ $+ [ %auth ] ]) || $readini(helpserv.ini, supporters, [ $+ [ %auth ] ])) {
    part $2 Destroyed by $nick
  }
  else { 
    notice $nick You Need Supporter Class to use this command.
  }
}
on *:TEXT:@join *:*: {
  whois $nick 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(helpserv.ini, admins, [ $+ [ %auth ] ]) || $readini(helpserv.ini, supporters, [ $+ [ %auth ] ])) {
    join $2 
  }
  else { 
    notice $nick You Need Supporter Class to use this command.
  }
}
