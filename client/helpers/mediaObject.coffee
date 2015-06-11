findMobilePath = (path) ->
  if device.platform.toLowerCase() == "android"
    console.log "android"
    return cordova.file.applicationDirectory.replace('file://', '') + 'www/application/' + path.substr(1)
  else
    console.log "iOS"
    return path

class Triratna.MediaObject
  
  playingDep: new Tracker.Dependency #reactivity for functions that .depend() on it
  currentPositionDep: new Tracker.Dependency
  currentPositionTimer: null
  
  externalMedia: null
  #playing: false
  
  constructor: (path) ->
    window.mo = this
    mediaObject = @
    
    ###@externalMedia = new Howl {
      src: [path]
      html5: true #so that file starts playing before being fully loaded
      onplay: () ->
        mediaObject.playingDep.changed()
        console.log "onplay triggered", @playing()
      onpause: () ->
        mediaObject.playingDep.changed()
        console.log "onpause triggered"
      onend: () ->
        mediaObject.playingDep.changed()
        console.log "onend triggered"
    }###
    
    #if Meteor.isCordova
    #  path = findMobilePath path
    
    @externalMedia = new Audio path
    @externalMedia.onplay = () ->
      mediaObject.playingDep.changed()
      console.log "onplay triggered"
    @externalMedia.onpause = () ->
      mediaObject.playingDep.changed()
      console.log "onpause triggered"
    @externalMedia.onend = () ->
      mediaObject.playingDep.changed()
      console.log "onend triggered"
    
    lastTime = null
    updatePos = () ->
      if lastTime != mediaObject.currentPosition()
        lastTime = mediaObject.currentPosition()
        mediaObject.currentPositionDep.changed()

    currentPositionTimer = Meteor.setInterval updatePos, 1000
  
  isPlaying: () ->
    @playingDep.depend()    
    console.log "isPlaying called", !@externalMedia.paused
    !@externalMedia.paused
    #@externalMedia.playing() howl.js
  
  play: () ->
    console.log "play"
    @externalMedia.play()
    if Meteor.isCordova #android browser doesn't seem respect onplay/onpause events
      Meteor.setTimeout @playingDep.changed, 1000 
  
  pause: () ->
    console.log "pause"
    @externalMedia.pause()
    if Meteor.isCordova #android browser doesn't seem respect onplay/onpause events
      Meteor.setTimeout @playingDep.changed, 1000
  
  stop: () ->
    console.log "stop"
    @externalMedia.pause()
    #@externalMedia.stop() Howl.js
    if Meteor.isCordova #android browser doesn't seem respect onplay/onpause events
      Meteor.setTimeout @playingDep.changed, 1000 
  
  currentPosition: () ->
    @currentPositionDep.depend()    
    parseInt(@externalMedia.currentTime) or 0
    #parseInt(@externalMedia.currentPosition()) or 0 Howl.js
  
  destroy: () ->
    Meteor.clearInterval @currentPositionTimer
    
  