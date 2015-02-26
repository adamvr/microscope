@Subscriptions = Subscriptions = new Mongo.Collection 'subscriptions'

Subscriptions.allow
  insert: (userId, doc, fields) ->
    ownsDocument(userId, doc)
  remove: (userId, doc, fields) ->
    ownsDocument(userId, doc)
