Template.errors.helpers
  errors: ->
    Errors.find()

Template.errors.rendered =  ->
  id = @data.id

  Meteor.setTimeout ->
    Errors.remove id
  , 3000
