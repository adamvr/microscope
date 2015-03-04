Template.subscribe.helpers
  subscribed: ->
    Subscriptions.findOne subscriberId: Meteor.userId(), subscribedId: @_id

Template.subscribe.events
  'click a': (e) ->
    e.preventDefault()

    sub = Subscriptions.findOne subscriberId: Meteor.userId(), subscribedId: @_id

    if not sub
      createSubscription Meteor.user(), @
    else
      Subscriptions.remove sub._id
