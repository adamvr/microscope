Template.errors.helpers
  errors: ->
    Errors.find()

Template.error.rendered = ->
  id = @data._id

  Meteor.setTimeout ->
    Errors.remove id
  , 3000
