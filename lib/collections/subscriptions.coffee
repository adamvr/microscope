@Subscriptions = Subscriptions = new Mongo.Collection 'subscriptions'

Subscriptions.allow
  remove: (userId, doc, fields) ->
    ownsDocument(userId, doc)
