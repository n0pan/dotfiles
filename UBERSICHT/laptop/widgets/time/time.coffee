command: "date +\"%H:%M\""

refreshFrequency: 10000 # ms

render: (output) ->
  "#{output}"

style: """
  -webkit-font-smoothing: antialiased
  text-align: center
  color: #d8d8d8
  font: 10px Iosevka
  overflow: hidden
  text-overflow: ellipsis
  width: 50%
  left: 25%
  bottom: 9px
"""
