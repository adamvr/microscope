Template.subscribe.helpers
  subscribed: ->
    Subscriptions.findOne userId: Meteor.userId(), subscribedId: @userId

Template.subscribe.events
  'click a': (e) ->
    e.preventDefault()

    sub = Subscriptions.findOne userId: Meteor.userId(), subscribedId: @userId

    if not sub
      Subscriptions.insert
        userId: Meteor.userId()
        subscribedId: @userId
        subscribedName: @author
        subscribedAt: new Date()
        notify: ['post']

    else
      Subscriptions.remove _id: sub._id
