Template.postEdit.events
  'submit form': (e) ->
    e.preventDefault()

    id = @_id

    post =
      url: $(e.target).find('[name="url"]').val()
      title: $(e.target).find('[name="title"]').val()

    errors = validatePost post

    if _.keys(errors).length > 0
      return Session.set 'postEditErrors', errors

    Posts.update id, $set: post, (err) ->
      if err
        throwError err.reason
      else
        Router.go 'postPage', _id: id

  'click .delete': (e) ->
    e.preventDefault()

    if confirm 'Delete this post?'
      Posts.remove @_id
      Router.go 'postsList'

Template.postEdit.rendered = ->
  Session.set 'postEditErrors', {}

Template.postEdit.helpers
  errorMessage: (field) ->
    Session.get('postEditErrors')[field]

  errorClass: (field) ->
    if Session.get('postEditErrors')[field] then 'has-error' else ''
