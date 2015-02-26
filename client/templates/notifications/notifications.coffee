Template.notifications.helpers
  notifications: ->
    Notifications.find
      userId: Meteor.userId()
      read: false

  notificationCount: ->
    Notifications.find
      userId: Meteor.userId()
      read: false
    .count()

Template.notificationItem.events
  'click a': (e) ->
    Notifications.update @_id, $set: read: true

  'click .dismiss' (e) ->
    # Prevent the link from working if we click here
    e.preventDefault()
    e.stopPropagation()

    Notifications.update @_id, $set: read: true

Template.notificationItem.helpers
  notificationPostPath: ->
    Router.routes.postPage.path _id: @postId
