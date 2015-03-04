@Subscriptions = Subscriptions = new Mongo.Collection 'subscriptions'

Subscriptions.allow
  insert: (userId, doc, fields) ->
    doc.subscriberId is userId
  remove: (userId, doc, fields) ->
    doc.subscriberId is userId

@createSubscription = (from, to, opts) ->
  # Default notify to just 'post'
  notify = opts?.notify || ['post']

  unless from and to
    return

  Subscriptions.insert
    subscriberId: from._id
    subscriberName: from.profile.name
    subscribedId: to._id
    subscribedName: to.profile.name
    subscribedAt: new Date()
    notify: notify

# Only try to ensureIndex on the server
if Meteor.isServer
  Subscriptions._ensureIndex {subscriberId: 1, subscribedId: 1}, {unique: true}
