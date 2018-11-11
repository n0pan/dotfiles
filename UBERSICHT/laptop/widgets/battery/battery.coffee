command: "pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto | cut -f1 -d'%'"

refreshFrequency: 150000 # ms

render: (output) ->
  if output > 50
    "bat <span style='color:#a1b470'>#{output}%</span>"  # f6c98c = yellow
  else if output < 51 && output > 15
    "bat <span style='color:#f6c98c'>#{output}%</span>"  # a94744 = red
  else
    "bat <span style='color:#ec615d'>#{output}%</span>"  # a1b470 = green

style: """
  -webkit-font-smoothing: antialiased
  font: 10px Iosevka
  bottom: 9px
  left: 1210px
  position: absolute
  color: #d8d8d8
  span
    color: #d8d8d8
"""
