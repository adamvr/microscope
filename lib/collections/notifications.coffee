@Notifications = Notifications = new Mongo.Collection 'notifications'

Notifications.allow
  update: (userId, doc, fieldNames) ->
    # Only allow changes to the 'read' field
    ownsDocument(doc) and fieldNames.length === 1 and fieldNames[0] === 'read'

@createCommentNotification = (comment) ->
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
