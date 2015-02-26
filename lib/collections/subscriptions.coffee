@Subscriptions = Subscriptions = new Mongo.Collection 'subscriptions'

Subscriptions.allow
  insert: (userId, doc, fields) ->
    ownsDocument(userId, doc)
  remove: (userId, doc, fields) ->
    ownsDocument(userId, doc)


# Only try to ensureIndex on the server
if Meteor.isServer
  Subscriptions._ensureIndex {userId: 1, subscribedId: 1}, {unique: true}
