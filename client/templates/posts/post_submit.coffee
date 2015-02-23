Template.postSubmit.events
  'submit form': (e) ->
    e.preventDefault()

    post =
      url: $(e.target).find('[name="url"]').val()
      title: $(e.target).find('[name="title"]').val()

    errors = validatePost post

    if _.keys(errors).length > 0
      Session.set 'postSubmitErrors', errors

    Meteor.call 'postInsert', post, (err, result) ->
      # Report error if post invalid
      return throwError err.reason if err

      # Report that the post has already been created
      throwError 'This link has already been posted' if result.postExists

      # Route to post page
      Router.go 'postPage', result

Template.postSubmit.created = ->
  Session.set 'postSubmitErrors', {}

Template.postSubmit.helpers
  errorMessage: (field) ->
    Session.get('postSubmitErrors')[field]

  errorClass: (field) ->
    if Session.get('postSubmitErrors')[field] then 'has-error' else ''
