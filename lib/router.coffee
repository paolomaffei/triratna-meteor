Router.configure {
  layoutTemplate: "layout"
  loadingTemplate: "loading"
  notFoundTemplate: "notFound"
  waitOn: -> return [Meteor.subscribe("categories"), Meteor.subscribe("meditations")]
}

Router.route "/", {name: "categoriesList"}

Router.route "/category/:_id", {
  name: "meditationsList"
  data: -> return Triratna.Collections.Categories.findOne this.params._id
}

Router.route "/meditation/:_id", {
  name: "playerPage"
  data: -> return Triratna.Collections.Meditations.findOne this.params._id
}