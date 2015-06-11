Meteor.publish 'categories', (options) ->
  #todo: only publish categories that the user can access
  return Triratna.Collections.Categories.find({}, options)

Meteor.publish 'meditations', (options) ->
  return Triratna.Collections.Meditations.find({}, options)