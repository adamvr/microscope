Template.postEdit.events
  'submit form': (e) ->
    e.preventDefault()

    id = @_id

    post =
      url: $(e.target).find('[name="url"]').val()
      title: $(e.target).find('[name="title"]').val()

    Posts.update id, $set: post, (err) ->
      if err
        alert err.reason
      else
        Router.go 'postPage', _id: id

  'click delete': (e) ->
    e.preventDefault()

    if confirm 'Delete this post?'
      Post.remove @_id
      Router.go 'postsList'
