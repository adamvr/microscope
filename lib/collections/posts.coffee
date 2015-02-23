@Posts = Posts = new Mongo.Collection 'posts'

Posts.allow
  update: (userId, doc) ->
    ownsDocument userId, doc
  remove: (userId, doc) ->
    ownsDocument userId, doc

Posts.deny
  update: (userId, doc, fieldNames) ->
    errors = validatePost doc
    _.keys(errors).length > 0

Meteor.methods
  postInsert: (postAttrs) ->
    # Make sure we're logged in
    check Meteor.userId(), String

    # Make sure everything is stringy
    check postAttrs,
      title: String,
      url: String

    # Validate the post
    errors = validatePost postAttrs

    if _.keys(errors).length > 0
      throw new Meteor.Error('invalid-post', 'You must set a title and a url for a post')

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

@validatePost = (post) ->
  errors = {}

  if (!post.title)
    errors.title = 'Please fill in a headline'

  if (!post.url)
    errors.url = 'Please fill in a post url'

  return errors;
