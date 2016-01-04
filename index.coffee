command: "date=$(date +%j) && remaining=\"$((365 - 10#$date))\" && echo \"$remaining\""

# Refresh Frequency in milliseconds
# 1 Day
refreshFrequency: (24 * 60 * 60 * 1000)

# render gets called after the shell command has executed. The command's output
# is passed in as a string. Whatever it returns will get rendered as HTML.
render: (output) ->
  formatNumber = (x) ->
    parts = x.toString().split(".")
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ".")
    parts.join(".")
  daysLeft = output
  targetCash = 1000000
  cashPerDay = formatNumber(Math.floor(targetCash / daysLeft))
  """
    <h1>Nur noch <span class="days">#{daysLeft}</span> Tage bis zum Ende des Jahres.</h1>
    <h1>Du brauchst <span class="days">#{cashPerDay}€</span> pro Tag.</h1>
  """

# the CSS style for this widget, written using Stylus
# (http://learnboost.github.io/stylus/)
style: """
  background: rgba(#fff, 0.65)
  border-radius: 2px
  border: 2px solid #fff
  box-sizing: border-box
  color: #141f33
  font-family: Helvetica Neue
  font-weight: 300
  line-height: 1.2em
  padding: 2px 12px
  top: 2%
  left: 2%

  h1
    font-size: 20px
    font-weight: 300
    color: #555

  .days
    color: black
    font-weight: bold
"""
