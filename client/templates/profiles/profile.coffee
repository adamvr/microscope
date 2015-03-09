Template.profile.helpers
  posts: ->
    Posts.find userId: @_id

  numPosts: ->
    Posts.find(userId: @_id).count().toString()

  following: ->
    Subscriptions.find subscriberId: @_id

  numFollowing: ->
    Subscriptions.find(subscriberId: @_id).count().toString()

  followedBy: ->
    Subscriptions.find subscribedId: @_id

  numFollowed: ->
    Subscriptions.find(subscribedId: @_id).count().toString()
