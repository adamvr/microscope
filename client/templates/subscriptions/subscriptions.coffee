Template.subscribe.helpers
  subscribed: ->
    Subscriptions.findOne userId: Meteor.userId(), subscribedId: @userId

Template.subscribe.events
  'click a': (e) ->
    e.preventDefault()

    Subscriptions.insert
      userId: Meteor.userId()
      subscribedId: @userId
      subscribedName: @author
      subscribedAt: new Date()
      notify: ['post']
