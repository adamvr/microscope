Meteor.publish 'posts', ->
  Posts.find()

Meteor.publish 'comments', (postId) ->
  check postId, String
  Comments.find postId: postId

Meteor.publish 'notifications', ->
  Notifications.find userId: @userId, read: false

Meteor.publish 'subscriptions', ->
  Subscriptions.find userId: @userId

Meteor.publish 'publicUsers', ->
  Meteor.users.find {}, fields: profile: true
