// This won't be necessary anymore.

on *:connect: {
  if ($network == BSIRC) {
    nick Daffy
    oper berend b3r3nd
    mode $me -ha
    sethost Bot.BSIRC
    setident Daffy
    setname #help
    join #Help
    mode #help +a $me
    mode #opers +a $me
  }
}
