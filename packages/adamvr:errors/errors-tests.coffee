Errors = @Errors

Tinytest.add 'Errors - collection', (test) ->
  test.equal Errors.collection.find().count(), 0

  Errors.throw 'error'
  test.equal Errors.collection.find().count(), 1

  Errors.collection.remove {}

Tinytest.addAsync 'Errors - template', (test, done) ->
  Errors.throw 'error'
  test.equal Errors.collection.find().count(), 1

  UI.render Template.meteorErrors, document.body

  Meteor.setTimeout ->
    test.equal Errors.collection.find().count(), 0
    done()
  , 3500
