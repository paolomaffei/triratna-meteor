Template.meditationsList.helpers {
  meditations: ->
    return Triratna.Collections.Meditations.find({categoryId: @._id})
}