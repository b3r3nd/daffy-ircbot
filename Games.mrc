on *:text:!meh:#: { 
  describe # gives $nick a cookie :*
  set %a [
  set %b ]
  msg #Daffy.overwatch %a $+ $nick $+ : $+ %auth $+ %b %a $+ $chan $+ : $+ 0 $+ %b $1 $+ :meh $2-
}
on *:text:!kick *:*: {
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %access $readini(users $+ $network $+ .ini, $chan $+ access, [ $+ [ %auth ] ])
  if ($nick isop # || %god [ $+ [ %auth ] ] == 1) {
    if (!$3) {
      kick # $2 Kicked by $nick (Bye.)
    }
    else { kick # $2 Kicked by $nick ( $+ $3- $+ ) }
  }
}
on *:text:!flag:#: {
  msg $chan 4,4!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  msg $chan 4,4!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  msg $chan 4,4!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  msg $chan 0,0!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  msg $chan 0,0!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!   
  msg $chan 0,0!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  msg $chan 12,12!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  msg $chan 12,12!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  msg $chan 12,12!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
on *:text:!gp *:*: {
  if ($nick == $2) { notice $nick You cant give yourself access | HALT }
  if ($3 < 0) { notice $nick You cant do this with less points then 0. | HALT }
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %points $readini(Points.ini, points, %auth)
  if ($3 >= %points) { notice $nick You cant give more points than you have. | HALT }
  else {
    dec %points $3
    var %auth2 $readini(dafauth.ini, nicks, $2)
    var %points2 $readini(Points.ini, points, %auth2)
    inc %points2 $3
    writeini points.ini points %auth %points
    writeini points.ini points %auth2 %points2
    notice $Nick I gave $2 $3 points. You have now %points points. And he/she has %points2
  }
}

on *:TEXT:!number *:*: {
  if (%number [ $+ [ $Nick ] ] == on) { msg $chan  $+ $nick $+ : Not so fast.. | HALT }
  if ($3 < 0) { notice $nick You cant do this with less points then 0. | HALT }
  whois $Nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %points $readini(Points.ini, points, %auth)
  if (%points >= $3) { 
    set %number $+ $nick on
    timer 1 60 unset %number [ $+ [ $nick ] ]
    var %number $rand(1,5)
    if (%number == $2) {
      msg $chan  $+ $nick $+ : Wow, you chose the right number sweetie :*, now you got your points 2 times back! 
      var %auth $readini(auth.ini, auths, $nick)
      var %points $readini(Points.ini, points, %auth)
      inc %points $3
      writeini points.ini points %auth %points
    }
    else { 
      msg $chan  $+ $Nick $+ : Damn.. you lost your points :( $3 points aauwwww.
      var %auth $readini(auth.ini, auths, $nick)
      var %points $readini(Points.ini, points, %auth)
      dec %points $3
      writeini points.ini points %auth %points
    }
  } 
}
on *:text:!google*:#: { msg $chan  $+ $nick $+ : http://www.google.com/search?btnG=1&pws=0&q= $+ $2- }
on *:TEXT:!test:#: {
  var %test $rand(1,2)
  if (%test == 1) { msg $chan  $+ $nick $+ : Failed. }
  if (%test == 2) { msg $chan  $+ $nick $+ : Succeed. }
}

on *:TEXT:!invite *:*: { 
  if ($Nick isop $chan) { 
    invite $2 $chan
  }
}
on *:text:!calc *:*: {
  if ($ini(Blacklist.ini, Users, $address($nick, 2))) { HALT }
  else {
    msg $chan  $+ $nick $+ : $calc($2-)
  }
}
on *:TEXT:!throw *:*: {
  if ($4 == $me) { notice $nick i'm your bot you.. | HALT }
  if ($ini(Blacklist.ini, Users, $address($nick, 2))) { HALT }
  else { 
    .describe $chan trows $2 to $4
  }
}
on *:TEXT:!hugs:#: { describe $chan hugs $nick }
on *:TEXT:!ping:#: { msg $chan  $+ $nick $+ : PONG }
on *:TEXT:!pong:#: { msg $chan  $+ $nick $+ : PING }
on *:TEXT:!spam:#: { $read(8ball.txt) }
on *:TEXT:!rslap *:*: { 
  var %auth $readini(dafauth.ini, nicks, $nick)
  if ($readini(admins.ini, 600, [ $+ [ %auth ] $+ ])) { 
    slap $2
  }
  else { msg $chan  $+ $nick $+ : Hm, i dont think i like you.
  }
}
on *:TEXT:!uptime:#: { 
  var %uptime = $duration($calc($ticks / 1000))
  if ($isid) return %uptime 
  msg $chan  $+ $nick $+ : %uptime
}
msg $chan  $+ $nick $+ : 
on *:TEXT:!Squealer:#: { msg $chan  $+ $nick $+ : wut nub. :') }
on *:TEXT:!Dance:#: { describe $chan Dances around $nick }
on *:TEXT:!JeFo:#: { msg $chan  $+ $nick $+ : n000000000b }
on *:TEXT:!Tomaaas:#: { msg $chan  $+ $nick $+ : I love Tomaaas 4<33333333333333333333 }
on *:TEXT:!littlehero:#: { msg $chan  $+ $nick $+ : I like him. :) }
on *:TEXT:!appel:#: { describe $chan hugs appel }
on *:TEXT:!hero_killer:#: { msg $chan  $+ $nick $+ : Lol, I think he fail :D }
on *:text:!lol:#: { msg $chan  $+ $nick $+ : Wut }
on *:text:!list:#: { msg $chan  $+ $nick $+ : I don't Have a list. }
on *:text:!f*ck:#: { msg $chan  $+ $nick $+ : I don't want to be part of your sick fantasies! }
on *:text:!sex:#: { msg $chan  $+ $nick $+ : I don't want to be part of your sick fantasies! }
on *:text:!banana:#: { msg $chan  $+ $nick $+ : I don't want to be part of your sick fantasies! }
on *:text:!berend:#: { msg $chan  $+ $nick $+ : My Lover. }
on *:text:!L3G0:#: { msg $chan  $+ $nick $+ : My Lover. }
on *:text:!wut:#: { msg $chan  $+ $nick $+ : WOOT }
on *:text:!wtf:#: { msg $chan  $+ $nick $+ : wut }
on *:text:!fail:#: { msg $chan  $+ $nick $+ : Failed agian }
on *:text:!porn:#: { msg $chan  $+ $nick $+ : I don't want to be part of your sick fantasies! }
on *:text:!hack:#: { msg $chan  $+ $nick $+ : What you want to do? }
on *:text:!what:#: { msg $chan  $+ $nick $+ : Wut? }
on *:TEXT:!calc:#: { msg $chan  $+ $nick $+ : Give me something to calc sweetie.. }
on *:TEXT:!hug:#: { msg $chan  $+ $nick $+ : Who should i hug now? }
on *:TEXT:!hug *:*: { describe $chan hugs $2. }
on *:text:!veronica:#: {
  msg $chan Veronica's 90's top 590 top 25.
  msg $chan 1.      	November Rain 	- Guns N' Roses 	
  msg $chan 2.     	Summer Of '69 	- Bryan Adams 	
  msg $chan 3.     	One 	- U2 	
  msg $chan 4.     	Thunderstruck 	- AC/DC 	
  msg $chan 5.     	Streets Of Philadelphia 	- Bruce Springsteen 	
  msg $chan 6.     	One 	- Metallica 	
  msg $chan 7.     	No Limit 	- 2 Unlimited 	
  msg $chan 8.     	Smells Like Teen Spirit 	- Nirvana 	
  msg $chan 9.     	Under The Bridge 	- Red Hot Chili Peppers 	
  msg $chan 10.    	Rainbow In The Sky 	- DJ Paul Elstak 	
  msg $chan 11.    	Nobody's Wife 	- Anouk 	
  msg $chan 12.    	God Is A DJ 	- Faithless 	
  msg $chan 13.    	Alive 	- Pearl Jam 	
  msg $chan 14.    	I Don't Wanna Miss A Thing - 	Aerosmith 	
  msg $chan 15.    	The Power 	- Snap! 	
  msg $chan 16.    	Nothing Else Matters 	- Metallica 	
  msg $chan 17.    	Losing My Religion 	- R.E.M. 	
  msg $chan 18.    	Angels 	- Robbie Williams 	
  msg $chan 19.    	Innuendo 	- Queen 	
  msg $chan 20.    	Going To The Run 	- Golden Earring 	
  msg $chan 21.    	Frozen 	- Madonna 	
  msg $chan 22.    	Wonderwall 	- Oasis 	
  msg $chan 23.    	Always 	- Bon Jovi 	
  msg $chan 24.    	Enjoy The Silence 	- Depeche Mode 	
  msg $chan 25.    	Knockin' On Heaven's Door 	- Guns N' Roses
  msg $chan End of Veronica's 90's top 590 top 25.
}
on *:TEXT:!fail *:*: {
  msg $chan  $+ $2 $+ : You failed. :o
  kick $2 $chan
}
on *:TEXT:!givepoints *:*: {
  whois $nick 
  whois $2
  var %auth $readini(dafauth.ini, auths, $nick)
  var %auth2 $readini(dafauth.ini, auths, $2)
  if ($readini(admins.ini, 500, [ $+ [ %auth ] $+ ])) { 
    writeini points.ini points %auth2 $$3-
    notice $nick $2 got now $3- points.
  }
  else { You need 500 oaccess for this command }
}
on *:TEXT:!points:#: { 
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  msg $chan Your Points: $readini(points.ini, points, %auth)
}
on *:TEXT:!points *:*: { 
  whois $2
  var %auth $readini(dafauth.ini, nicks, $2)
  msg $chan $2 $+ 's Points: $readini(points.ini, points, %auth)
}
on *:TEXT:!setin *:*: {
  if ($2 < 0) { notice $nick You cant do this with less points then 0. | HALT }
  set %authhh $readini(dafauth.ini, nicks, $nick)
  whois $Nick
  set %pointss $readini(Points.ini, points, %authhh)
  if (%actief [ $+ [ $nick ] ] == on) { msg $chan  $+ $nick $+ : Not so fast.. | HALT }
  if (%pointss >= $2) {
    set %actief $+ $nick on
    var %test $rand(1,4)
    timer111 $+ $nick 1 288 unset %actief $+ $nick
    if (%test == 1) {
      msg $chan  $+ $nick $+ : you gave me $2 points, but i could do nothing for you sorry.
    }
    if (%test == 2) {
      msg $chan  $+ $nick  $+ : you gave me $2 points, and you get your points 2 times back sweetie :* 
      set %pointss $readini(Points.ini, points, %authhh)
      inc %pointss [ [ $2 ] ]
      writeini points.ini points %authhh %pointss
    }
    if (%test == 3) {
      msg $chan  $+ $nick  $+ : you gave me $2 points, and you get your points 2 times back sweetie :* 
      set %pointss $readini(Points.ini, points, %authhh)
      inc %pointss [ [ $2 ] ]
      writeini points.ini points %authhh %pointss
    }
    if (%test == 4) {
      msg $chan  $+ $nick $+ : you gave me $2 points, And You lose all the points you gave me. :(
      set %pointss $readini(Points.ini, points, %authhh)
      dec %pointss [ [ $2 ] ]
      writeini points.ini points %authhh %pointss
    }
  }
  else { msg $chan  $+ $nick  $+ : You dont have enough points :').
  }
}
on *:TEXT:!rr *:*: {
  if ($2 < 0) { notice $nick You cant do this with less points then 0. | HALT }
  whois $nick
  var %auth $readini(dafauth.ini, nicks, $nick)
  var %points $readini(Points.ini, points, %auth)
  if (%points < $2) { msg $chan  $+ $Nick $+ : You dont have enough points. | HALT }
  if ($2 < 200) { msg $chan  $+ $nick $+ : You need at least 200 points for this. | HALT }
  if (%rr [ $+ [ $nick ] ] == on) { msg $chan  $+ $Nick $+ : Not so fast.. | HALT }
  else {
    var %authr $readini(dafauth.ini, nicks, $nick)
    var %pointsr $readini(Points.ini, points, %authr)
    dec %pointsr $2
    writeini points.ini points %authr %pointsr
    msg $chan You Started Russian Roulette. Write r. (with $2 points)
    set %inzet $+ $nick $2
    set %inzett $+ $nick $2
    set %rr $+ $nick on
  }
}
on *:TEXT:!r:#: {
  if (%rr [ $+ [ $nick ] ] == on) {
    set %rrr $rand(1,6)
    if (%rrr == 1) {
      msg $chan BULLET! *BOEM* DEAD!
      unset %rr $+ $nick 
      msg $chan  $+ $nick $+  You lost your points auwww ( $+ %inzet [ $+ [ $nick ] ] $+ ).
      set %auth $+ $nick $readini(auth.ini, auths, $nick)
      set %points $+ $nick $readini(Points.ini, points, %auth [ $+ [ $nick ] ])
      dec %points $+ $nick %inzet [ $+ [ $nick ] ]
    }
    if (%rrr == 2) { 
      inc %won $+ $nick
      inc %inzet $+ $nick 100
      msg $chan *CLICK* Empty, Lucky you. Your points now: %inzet [ $+ [ $nick ] ] 
    }
    if (%rrr == 3) { 
      inc %won $+ $nick 
      inc %inzet $+ $nick 100
      msg $chan *CLICK* Empty, Lucky you. Your points now: %inzet [ $+ [ $nick ] ] 
    }
    if (%rrr == 4) { 
      inc %won $+ $nick
      inc %inzet $+ $nick 100
      msg $chan *CLICK* Empty, Lucky you. Your points now: %inzet [ $+ [ $nick ] ] 
    }
    if (%rrr == 5) { 
      inc %won $+ $nick
      inc %inzet $+ $nick 100
      msg $chan *CLICK* Empty, Lucky you. Your points now: %inzet [ $+ [ $nick ] ] 
    }
    if (%rrr == 6) {
      msg $chan BULLET! *BOEM* DEAD!
      unset %rr $+ $nick 
      msg $chan  $+ $nick $+  You lost your points auwww ( $+ %inzet [ $+ [ $nick ] ] $+ ).
      set %auth $+ $nick $readini(dafauth.ini, nicks, $nick)
      set %points $+ $nick $readini(Points.ini, points, %auth [ $+ [ $nick ] ])
      dec %points $+ $nick %inzet [ $+ [ $nick ] ]
    }
  }
}
on *:TEXT:!sr:#: {
  if (%rr [ $+ [ $nick ] ] == on) {
    whois $Nick
    set %auth $+ $nick $readini(dafauth.ini, nicks, $nick)
    set %points [ $+ [ $nick ] ] $readini(Points.ini, points, %auth [ $+ [ $nick ] ])
    inc %points [ $+ [ $nick ] ] %inzet [ $+ [ $nick ] ]
    writeini points.ini points %auth [ $+ [ $nick ] ] %points [ $+ [ $nick ] ]
    unset %rr $+ $Nick
    msg $chan  $+ $nick $+ : Your points now: %points [ $+ [ $nick ] ] $+ .
  }
  else { msg $chan  $+ $nick $+ : You're not playing Russian Roulette.. 
  }
}
on *:TEXT:!ln:#: {
  whois $Nick
  if (%ln [ $+ [ $nick ] ] == on) {  msg $chan  $+ $nick $+ : You can do this one time in 20s. | HALT }
  else {
    var %auth $readini(dafauth.ini, nicks, $nick)
    set %ln $+ $nick on
    timer $+ $nick $+ 3 1 20 unset %ln $+ $nick
    var %ln $rand(1,22) 
    if (%ln == 1) { 
      msg $chan  $+ $nick $+ : You're Lucky Number is 1. You get 10 points! 
      set %points $readini(Points.ini, points, %auth)
      inc %Points 10
      writeini points.ini points %auth %points
    }
    if (%ln == 2) { 
      msg $chan  $+ $nick $+ : You're Lucky Number is 2. You get 20 points! 
      set %points $readini(Points.ini, points, %auth)
      inc %Points 20
      writeini points.ini points %auth %points
    }
    if (%ln == 3) { 
      msg $chan  $+ $nick $+ : You're Lucky Number is 3. You get 30 points! 
      set %points $readini(Points.ini, points, %auth)
      inc %Points 30
      writeini points.ini points %auth %points
    }
    if (%ln == 4) { 
      msg $chan  $+ $nick $+ : You're Lucky Number is 4. You get 40 points!
      set %points $readini(Points.ini, points, %auth)
      inc %Points 40
      writeini points.ini points %auth %points
    }
    if (%ln == 5) { 
      msg $chan  $+ $nick $+ : You're Lucky Number is 5. You get 50 points!
      set %points $readini(Points.ini, points, %auth)
      inc %Points 50
      writeini points.ini points %auth %points
    }
    if (%ln == 6) { 
      msg $chan  $+ $nick $+ : You're Lucky Number is 6. You get 60 points! 
      set %points $readini(Points.ini, points, %auth)
      inc %Points 60
      writeini points.ini points %auth %points
    }
    if (%ln == 7) { 
      msg $chan  $+ $nick $+ : You're Lucky Number is 7. You get 70 points! 
      set %points $readini(Points.ini, points, %auth)
      inc %Points 70
      writeini points.ini points %auth %points
    }
    if (%ln == 8) { 
      msg $chan  $+ $nick $+ : You're Lucky Number is 8. You get 80 points! 
      set %points $readini(Points.ini, points, %auth)
      inc %Points 80
      writeini points.ini points %auth %points
    }
    if (%ln == 9) { 
      msg $chan  $+ $nick $+ : You're Lucky Number is 9. You get 90 points! 
      set %points $readini(Points.ini, points, %auth)
      inc %Points 90
      writeini points.ini points %auth %points
    }
    if (%ln == 10) { 
      msg $chan  $+ $nick $+ : You're Lucky Number is 10. You get 100 points! 
      set %points $readini(Points.ini, points, %auth)
      inc %Points 100
      writeini points.ini points %auth %points
    }
    if (%ln == 11) { 
      msg $chan  $+ $nick $+ : You're Lucky Number is 1. You get 10 points! 
      set %points $readini(Points.ini, points, %auth)
      inc %Points 10
      writeini points.ini points %auth %points
    }
    if (%ln == 12) { 
      msg $chan  $+ $nick $+ : You're Lucky Number is 1. You get 60 points! 
      set %points $readini(Points.ini, points, %auth)
      inc %Points 60
      writeini points.ini points %auth %points
    }
    if (%ln == 13) { 
      msg $chan  $+ $nick $+ : You're Lucky Number is 2. You get 20 points! 
      set %points $readini(Points.ini, points, %auth)
      inc %Points 20
      writeini points.ini points %auth %points
    }
    if (%ln == 14) { 
      msg $chan  $+ $nick $+ : You're Lucky Number is 2. You get 50 points! 
      set %points $readini(Points.ini, points, %auth)
      inc %Points 50
      writeini points.ini points %auth %points
    }
    if (%ln == 15) { 
      msg $chan  $+ $nick $+ : You're Lucky Number is 7. You get 70 points! 
      set %points $readini(Points.ini, points, %auth)
      inc %Points 70
      writeini points.ini points %auth %points
    }
    if (%ln == 16) { 
      msg $chan  $+ $nick $+ : Oh oh, no lucky number. -100 Points.
      set %points $readini(Points.ini, points, %auth)
      dec %Points 100
      writeini points.ini points %auth %points
    }
    if (%ln == 17) { 
      msg $chan  $+ $nick $+ : Oh oh, no lucky number. -30 Points.
      set %points $readini(Points.ini, points, %auth)
      dec %Points 30
      writeini points.ini points %auth %points
    }
    if (%ln == 18) { 
      msg $chan  $+ $nick $+ : Oh oh, no lucky number. -10 Points.
      set %points $readini(Points.ini, points, %auth)
      dec %Points 10
      writeini points.ini points %auth %points
    }
    if (%ln == 19) { 
      msg $chan  $+ $nick $+ : Oh oh, no lucky number. -20 Points.
      set %points $readini(Points.ini, points, %auth)
      dec %Points 20
      writeini points.ini points %auth %points
    }
    if (%ln == 20) { 
      msg $chan  $+ $nick $+ : Oh oh, no lucky number. -40 Points.
      set %points $readini(Points.ini, points, %auth)
      dec %Points 40
      writeini points.ini points %auth %points
    }
    if (%ln == 21) { 
      msg $chan  $+ $nick $+ : Oh oh, no lucky number. -10 Points.
      set %points $readini(Points.ini, points, %auth)
      dec %Points 10
      writeini points.ini points %auth %points
    }
    if (%ln == 22) { 
      msg $chan  $+ $nick $+ : Oh oh, no lucky number. -10 Points.
      set %points $readini(Points.ini, points, %auth)
      dec %Points 10
      writeini points.ini points %auth %points
    }
  }
}

on *:TEXT:!ht *:*: {
  if ($3 < 0) { notice $nick You cant do this with less points then 0. | HALT }
  whois $nick
  set %auth $readini(dafauth.ini, nicks, $nick)
  set %points $readini(Points.ini, points, %auth)
  set %points2 $3
  if (%actieff [ $+ [ $nick ] ] == on) { msg $chan  $+ $nick  $+ : Dont play games so fast.. | HALT }
  if (%points >= %points2) {
    if ($2 == Heads) { 
      set %actieff $+ $nick on
      timer $+ $nick $+ actieff 1 60 unset %actieff $+ $Nick
      var %kopmunt $rand(1,2)
      if (%kopmunt == 1) { 
        msg $chan  $+ $nick $+ : TAILS! That means You lose $3 points, auwww :(
        dec %points $3
        writeini points.ini points %auth %points
      }
      if (%kopmunt == 2) { 
        msg $chan  $+ $nick $+ : HEADS! You get $3 points!
        inc %points $3
        writeini points.ini points %auth %points
      }
    }
    if ($2 == TAILS) {
      var %kopmunt $rand(1,2)
      if (%kopmunt == 1) { 
        msg $chan  $+ $nick $+ : HEADS! That means You lose $3 points, auwww :(
        dec %points $3
        writeini points.ini points %auth %points
      }
      if (%kopmunt == 2) { 
        msg $chan  $+ $nick $+ : TAILS! You get $3 points!
        inc %points $3
        writeini points.ini points %auth %points
      }
    }
  }
  else { msg $chan  $+ $nick  $+ : You have not enough points.
  }
}
on *:text:*:#: {
  if ($1 == $ $+ ttt) {
    msg $chan $nick Started tic tac toe with $2 $+ . $2 is X and $nick is o.
    var %c 0
    var %t 15
    while (%c < %t) {
      inc %c
      set %b [ $+ [ %c ] ] .
    }
    set %speler1 $nick 
    set %speler2 $2 
    set %beurt $2
    goto bord
  }
  if ($1 == % $+ play) {
    if (%b [ $+ [ $2 ] ] == x || %b [ $+ [ $2 ] ] == o) { HALT }
    if ($nick == %speler2 && %beurt == $nick) {
      set %beurt %speler1
      set %b [ $+ [ $2 ] ] x
      goto Bord
    }
    if ($nick == %speler1 && %beurt == $nick) {
      set %beurt %speler2
      set %b [ $+ [ $2 ] ] o
      goto Bord
    }
  }
  else { halt }
  :Bord
  msg $chan 7 $+ %b1 12\ 7 $+ %b2 12\ 7 $+ %b3 12\ 7 $+ %b4 12\ 7 $+ %b5 
  msg $chan 12---------------
  msg $chan 7 $+ %b6 12\ 7 $+ %b7 12\ 7 $+ %b8 12\ 7 $+ %b9 12\ 7 $+ %b10
  msg $chan 12---------------
  msg $chan 7 $+ %b11 12\ 7 $+ %b12 12\ 7 $+ %b13 12\ 7 $+ %b14 12\ 7 $+ %b15 
}
