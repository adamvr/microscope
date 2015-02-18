@Posts = new Mongo.Collection 'posts'

@Posts.allow
  insert: (userId, doc) ->
    return !!userId
