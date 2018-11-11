command: "ESC=`printf \"\e\"`; ps -A -o %mem | awk '{s+=$1} END {print \"\" s}'"

refreshFrequency: 2000 # ms

render: (output) ->
  "mem #{output}"

style: """
  -webkit-font-smoothing: antialiased
  color: #d8d8d8
  font: 10px Iosevka
  left: 1120px
  position: absolute
  bottom: 9px
"""
