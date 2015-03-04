Meteor.publish 'posts', ->
  Posts.find()

Meteor.publish 'comments', (postId) ->
  check postId, String
  Comments.find postId: postId

Meteor.publish 'notifications', ->
  Notifications.find userId: @userId, read: false

Meteor.publish 'subscriptions', ->
  Subscriptions.find subscriberId: @userId

Meteor.publish 'userSubscriptions', (userId) ->
  Subscriptions.find subscriberId: userId

Meteor.publish 'publicUsers', ->
  Meteor.users.find {}, fields: profile: true
