Template.profile.helpers
  posts: ->
    Posts.find userId: @_id

  following: ->
    Subscriptions.find userId: @_id

  followedBy: ->
    Subscriptions.find subscribedId: @_id
