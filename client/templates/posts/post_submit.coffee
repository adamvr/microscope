Template.postSubmit.events
  'submit form': (e) ->
    e.preventDefault()

    post =
      url: $(e.target).find('[name="url"]').val()
      title: $(e.target).find('[name="title"]').val()

    Meteor.call 'postInsert', post, (err, result) ->
      # Report error if post invalid
      return throwError err.reason if err

      # Report that the post has already been created
      throwError 'This link has already been posted' if result.postExists

      # Route to post page
      Router.go 'postPage', result
