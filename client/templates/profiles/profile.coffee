Template.profile.helpers
  posts: ->
    Posts.find userId: @_id
