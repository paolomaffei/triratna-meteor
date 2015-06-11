sound = null
currentPositionTimer = null

Template.playerPage.onCreated ->
  m = Triratna.Collections.Meditations.findOne({_id: @data._id})
  
  path = "/meditations/" + m.filename
  #path = m.streamingUrl
  
  sound = new Triratna.MediaObject path

Template.playerPage.helpers {
  playOrPause: () ->
    if sound.isPlaying() then return "pause" else return "play"
  position: () ->
    sound.currentPosition()
}

Template.playerPage.events {
  'click .player-playbutton': (e) ->
    sound.play()
  'click .player-pausebutton': (e) ->
    sound.pause()
}

Template.playerPage.onDestroyed ->
  sound.stop()
  sound.destroy()