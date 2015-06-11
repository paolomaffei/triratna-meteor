Template.registerHelper "secondsToHoursMinutesAndSeconds", (duration) ->
  s = duration%60
  m = parseInt(duration/60)
  
  h = 0
  if m > 60
    h = parseInt(m/60)
    m - h*60
  
  if h
    if m > 0
      return h + " hours and " + m + " minutes"
    else
      return h + " hours"
  else
    if s > 0
      return m + " minutes and " + s + " seconds"
    else
      return m + " minutes"

Template.registerHelper "formatTime", (seconds, format) ->
  time = moment.duration {seconds: seconds}
  return time.format format