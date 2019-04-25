on *:text:!version:#: {
  notice $nick Daffy. Duffy, Doffy IRCbots. Scripted by berend.
  Notice $nick Scripted in the mIRC Scripting Language (mSL) For Bugs reports. Or bot requests join #berend
  notice $Nick Daffy - Channel management bot. Uses trigger $. Write $ $+ help for more info.
  notice $Nick Doffy - Helpserv bot. You can not use this bot most of the time. But the trigger is @ en write @help for more info.
  notice $Nick Duffy - Funbot. Uses trigger !. For more info use !Help.
  notice $nick If you have any other questions you can just come into my channel. Or /query berend
  notice $Nick End of Version $+ .
}
on *:text:!help:#: {
  notice $Nick Duffy IRCbot, mSL scripted by berend ( $+ #berend $+ )
  notice $nick Games               Shows the games and there commands.
  notice $nick Oaccess             Commands where oaccess is needed.
  notice $nick Channel             Help with some other channel commands.
  notice $nick Fun                      Help with the other fun comands.
  notice $Nick End of Help commands Duffy.
}

on *:text:!help *:*: {
  if ($2 == Games) {
    notice $nick Help Commands Duffy Games
    notice $nick Setin                                           Setin some points, and maybe get some back.
    notice $nick rr                                                 Play Russian Roulette. (200 points minimum)
    notice $nick r                                                  Next round Russian Roulette
    notice $nick sr                                               Stop Russian Roulette, and earn points.
    notice $nick ln                                                Play Lucky Number
    notice $nick ht                                                Head or tails
    notice $nick Number                                       Try to find the lucky number.
    notice $Nick End of Help commands Duffy. 
  }
  if ($2 == Oaccess) { 
    notice $nick Help Commands Duffy Oaccess
    notice $nick Love                                             Love someone.
    notice $nick Dance                                          Dance around tututututuu *ahum*
    notice $nick Hug                                              Hug someone.
    notice $nick Kiss                                             Kiss someone.
    notice $Nick End of Help commands Duffy. 
  }
  if ($2 == Channel) { 
    notice $nick Help Commands Duffy Channel
    notice $nick Op                                               Op's a user in the channel. (@)
    notice $nick Deop                                           Deop's a user in the channel. (@)
    notice $nick Voice                                           Voices a user in the channel. (+)
    notice $nick Devoice                                       Devoices a user in the channel (+)
    notice $nick Dva                                               Devoices everybody on the channel Except Daffy. (+)
    notice $nick Va                                                 Gives everybody voice in the channel. (+)
    notice $Nick End of Help commands Duffy. 
  }
  if ($2 == Fun) { 
    notice $nick Help Commands Duffy Fun (overig)
    notice $nick Test                                             Test it.
    notice $nick Invite                                           Invites a user to the channel.
    notice $nick Uptime                                         Uptime from the bot.
    notice $nick Calc                                              Calc something.
    notice $nick Throw                                          Throw something to someone.
    notice $nick Ping                                             Play Ping Pong.
    notice $nick Pong                                             Play Pong Ping.
    notice $nick Spam                                           Try it out.
    notice $nick Sex                                              Sex!?
    notice $nick F*ck                                             F*ck!
    notice $nick Banana                                        banananananananananananaan's
    notice $nick Porn                                            P0rn00000.
    notice $nick Flag                                            Nederland OOOOO Nederland!
    notice $nick appel                                           appel.
    notice $nick Tomaaas                                    Tomaaas.
    notice $nick littlehero                                    Littlehero.
    notice $nick berend                                       <33333
    notice $nick Squealer                                   wut nub
    notice $nick wut                                             Wuuuut.
    notice $nick wtf                                              wtf.
    notice $nick Fail                                              Failed
    notice $nick hack                                            Hacking! :o
    notice $nick Points                                         Chek your points.
    notice $Nick End of Help commands Duffy. 
  }
}
