@Comments = Comments = new Mongo.Collection 'comments'

Meteor.methods
  commentInsert: (attrs) ->
    check @userId, String
    check attrs,
      postId: String
      body: String

    user = Meteor.user()
    post = Posts.findOne attrs.postId

    if not post
      throw new Meteor.Error('invalid-comment', 'You must comment on a post')

    comment = _.extend attrs,
      userId: user._id
      author: user.username
      submitted: new Date()

    Posts.update post._id, $inc: commentsCount: 1

    # Save comments id
    comment._id = Comments.insert comment

    # Create notification
    createCommentNotification comment

    # Return newly created comment id
    comment._id
