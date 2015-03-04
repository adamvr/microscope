Template.profile.helpers
  posts: ->
    Posts.find userId: @_id

  following: ->
    Subscriptions.find subscriberId: @_id

  numFollowing: ->
    Subscriptions.find(subscriberId: @_id).count()

  followedBy: ->
    Subscriptions.find subscribedId: @_id

  numFollowed: ->
    Subscriptions.find(subscribedId: @_id).count()
