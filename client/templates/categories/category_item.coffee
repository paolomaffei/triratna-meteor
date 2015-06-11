###Template.categoryItem.events {
  'click': (e) ->
    e.preventDefault();
    Meteor.call('openMeditation', this._id)
}###