on *:text:$version:#: {
  notice $nick Daffy. Duffy, Doffy IRCbots. Scripted by berend.
  Notice $nick Scripted in the mIRC Scripting Language (mSL) For Bugs reports. Or bot requests join #berend
  notice $Nick Daffy - 3497 Lines. Channel management bot. Uses trigger $. Write $ $+ help for more info.
  notice $Nick Doffy - 1173 Lines. Helpserv bot. You can not use this bot most of the time. But the trigger is @ en write @help for more info.
  notice $Nick Duffy - 2182 Lines. Funbot. Uses trigger !. For more info use !Help.
  notice $nick If you have any other questions you can just come into my channel. Or /query berend
  notice $Nick End of Version $+ .
}
on *:text:$help:#: {
  notice $Nick Daffy IRCbot, mSL scripted by berend ( $+ #berend $+ )
  notice $nick Userscript               Help with the userlist.
  notice $nick Settings                   Help with the Channel settings.
  notice $nick BanScript                Help with the Channel Bans.
  notice $nick Admincmd               List with Admin Commands and oaccess you need.
  notice $nick Usetcmd                 List uset commands.
  notice $nick Usercmd                 List user commands in the channel.
  notice $Nick End of Help commands Daffy.
}
on *:text:$help *:*: {
  if ($2 == Userscript) {
    notice $nick Userscript Commands Daffy
    notice $nick Users                                            Show the users, and there access.
    notice $nick ReadUsers                                   Read the users on the channel Users with op get 300 access. And users with voice get 100 access.
    notice $nick A                                                    Shows your access. Or the access of the user you wrote.
    notice $nick Ma                                                Shows your access in all channels, or that from the user you wrote.
    notice $nick Peons                                           Show the users with access 100.
    notice $nick Ops                                               Show the users, with access 200.
    notice $nick Masters                                        Show the users, with access 300.
    notice $nick Co-Owners                                  Show the users, with access 400.
    notice $nick Owners                                        Show the users, with access 500.
    notice $nick Adduser <nick> <level>              Add a user to the userlist. (Access: 100-200-300-400-500)
    notice $nick AddPeon <nick>                          Add a Peon to the userlist with access 100.
    notice $nick AddOp <nick>                              Add a Op to the userlist with access 200.
    notice $nick AddMaster <nick>                      Add a Master to the userlist with access 300.
    notice $nick AddCoOwer <nick>                    Add a Co-Owner to the userlist with access 400.
    notice $nick AddOwer <nick>                         Add a Owner to the userlist with access 500. (Need God mode)
    notice $nick Deluser <nick>                           Delete a user to the userlist. 
    notice $nick Clvl <nick> <level>                     Gives a user a new access.. (Access: 100-200-300-400-500)
    notice $nick Resync                                        Set the channel access equal to the userlist.
    notice $nick Up                                                Set your channel access equal to the userlist.
    notice $nick Down                                           Removes your access to the channel (not the userlist)
    notice $Nick End of Userscript commands Daffy.
  }
  if ($2 == admincmd) {
    whois $nick
    var %auth $readini(dafauth.ini, nicks, $nick)
    if ($readini(admins.ini, 500, [ $+ [ %auth ] $+ ])) {
      notice $nick Admin Commands Daffy
      notice $Nick 1000       -       Addadmin
      notice $Nick 1000       -       Deladmin
      notice $Nick 1000       -       adminclvl
      notice $Nick 1000       -       Do
      notice $Nick 800        -        God 
      notice $Nick 800        -        Nick
      notice $Nick 700        -        Reg
      notice $Nick 700        -        Unreg
      notice $Nick 600        -        Say
      notice $Nick 600        -        Emote
      notice $Nick 600        -        Part
      notice $Nick 600        -        Join
      notice $Nick 600        -        rslap
      notice $Nick 500        -        Givepoints
      notice $Nick 500        -        Love
      notice $Nick 500        -        Kiss
      notice $Nick 500        -        Slap
      notice $Nick 000        -        oa
      notice $Nick End of Admins commands Daffy.
    }
  }
  if ($2 == settings) {
    notice $nick Setting Commands Daffy
    notice $nick Set                                               Show the Settnigs.
    notice $nick Giveops <level>                         The access you need to get op (@) in the channel. 
    notice $nick Givevoice <level>                      The access you need to get voice (+) in the channel.
    notice $nick Enfops <level>                            The access you need to give op (@) To someone.
    notice $nick Enfvoice <level>                         The access you need to Give voice (+) to someone.
    notice $nick Setters <level>                            The access you need to use the settings.
    notice $nick Autovoice <0/1>                         Gives voice to every user that joins the channel.
    notice $nick Userscript <level>                      The access you need to use the user commands.
    notice $nick Banscript <level>                        The access you need to use the Ban commands.
    notice $nick Protect <1/2/3>                           Change your own protection in the channel. 1 = Low. 2 = normal. 3 = high.
    notice $nick Uset <level>                                The access you need to use the uset commands.
    notice $Nick End of Setting commands Daffy.
  }
  if ($2 == banscript) {
    notice $nick banscript Commands Daffy
    notice $nick Bans                                           Shows the Channel Bans.
    notice $nick Savebans                                   Sets the banlist equal to the channel bans.
    notice $nick Rban                                           Sets the channel bans equal to the banlist.
    notice $nick Uba                                             Unbans everybody in the channel (not on the list)
    notice $nick Delbanall                                   Removes all the bans on the list (Not on the channel)
    notice $nick Addban <host>                           Add a ban in the channel. 
    notice $nick Delban <host>                           Deletes a ban in the channel.
    notice $nick Kickban <level>                         Kickbanned a user from the channel, and add the ban to the banlist.
    notice $Nick End of Banscript commands Daffy.
  }
  if ($2 == usetcmd) {
    notice $nick Uset Commands Daffy
    notice $nick Uset                                            Show the uset settings.
    notice $nick Joininfo                                      Set's your joininfo.
    notice $nick Partinfo                                      Set's your partinfo
    notice $nick Remjoininfo                               Removes your joininfo.
    notice $nick Rempartinfo                              Removes your partinfo
    notice $nick Setinfo                                       Set's both the info's for a user (Need god mode enabled)
    notice $nick Reminfo                                     Removes both the info's for a user (Need god mode enabled)
    notice $Nick End of Uset commands Daffy. 
  }
  if ($2 == usercmd) {
    notice $nick User Commands Daffy
    notice $nick Op                                               Op's a user in the channel. (@)
    notice $nick Deop                                           Deop's a user in the channel. (@)
    notice $nick Voice                                           Voices a user in the channel. (+)
    notice $nick Devoice                                       Devoices a user in the channel (+)
    notice $nick Dva                                               Devoices everybody on the channel Except Daffy. (+)
    notice $nick Va                                                 Gives everybody voice in the channel. (+)
    notice $nick Opa                                              Gives everybody Op in the channel. (@)
    notice $nick Dpa                                              Deop's everybody in the channel. (@)
    notice $Nick End of User commands Daffy. 
  }
}
