command: "ESC=`printf \"\e\"`; ps -A -o %cpu | awk '{s+=$1} END {printf(\"%.1f\",s/8);}'"

refreshFrequency: 2000 # ms

render: (output) ->
  "cpu <span>#{output}</span>"

style: """
  -webkit-font-smoothing: antialiased
  color: #d8d8d8
  font: 10px Iosevka
  left: 1030px
  bottom: 9px
  span
    color: #d8d8d8

"""
