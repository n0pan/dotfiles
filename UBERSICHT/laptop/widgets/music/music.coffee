command: "osascript 'get current track.applescript'"

refreshFrequency: 1000 # ms

render: (output) ->
  "#{output}"

style: """
  -webkit-font-smoothing: antialiased
  color: #d8d8d8
  font: 10px Iosevka
  left: 30px 
  overflow: hidden
  text-overflow: ellipsis
  bottom: 9px
  width: 50%
"""
