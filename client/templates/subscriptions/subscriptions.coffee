Template.subscribe.helpers
  subscribed: ->
    Subscriptions.findOne userId: Meteor.userId(), subscribedId: @_id

Template.subscribe.events
  'click a': (e) ->
    e.preventDefault()

    sub = Subscriptions.findOne userId: Meteor.userId(), subscribedId: @_id

    if not sub
      Subscriptions.insert
        userId: Meteor.userId()
        subscribedId: @_id
        subscribedName: @profile.name
        subscribedAt: new Date()
        notify: ['post']

    else
      Subscriptions.remove _id: sub._id
