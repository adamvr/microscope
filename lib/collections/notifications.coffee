@Notifications = Notifications = new Mongo.Collection 'notifications'

Notifications.allow
  update: (userId, doc, fieldNames) ->
    # Only allow changes to the 'read' field
    ownsDocument(userId, doc) and fieldNames.length is 1 and fieldNames[0] is 'read'

# Observe notification-worthy events
Meteor.startup ->
  Comments.find().observe
    added: (comment) ->
      # Fetch appropriate post
      post = Posts.findOne comment.postId

      # Add notification if comment added to non owned post
      if comment.userId isnt post.userId
        Notifications.insert
          userId: post.userId
          postId: post._id
          commentId: comment._id
          commenterName: comment.author
          read: false
          type: 'comment'

  Posts.find().observe
    added: (post) ->
      # Find everyone who might be interested
      subs = Subscriptions.find subscribedId: post.userId, notify: 'post'

      # Create a notification for each
      subs.forEach (s) ->
        Notifications.insert
          userId: s.subscriberId
          postId: post._id
          posterName: post.author
          read: false
          type: 'post'
