@Posts = Posts = new Mongo.Collection 'posts'

Posts.allow
  update: (userId, doc) ->
    ownsDocument userId, doc
  remove: (userId, doc) ->
    ownsDocument userId, doc

Posts.deny
  update: (userId, doc, fieldNames) ->
    (_.without fieldNames, 'url', 'title').length > 0

Meteor.methods
  postInsert: (postAttrs) ->
    # Make sure we're logged in
    check Meteor.userId(), String

    # Make sure everything is stringy
    check postAttrs,
      title: String,
      url: String

    # Make sure this url isn't alread submitted
    existing = Posts.findOne url: postAttrs.url

    # Report that this post already exists, if necessary
    if existing
      return _id: existing._id, postExits: true

    # Create post document
    user = Meteor.user();
    post = _.extend postAttrs,
      userId: user._id
      author: user.username
      submitted: new Date()

    # Save it
    postId = Posts.insert post

    # Pass the id of the created post back
    return _id: postId
