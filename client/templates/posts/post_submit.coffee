Template.postSubmit.events
  'submit form': (e) ->
    e.preventDefault()

    post =
      url: $(e.target).find('[name="url"]').val()
      title: $(e.target).find('[name="title"]').val()

    Meteor.call 'postInsert', post, (err, result) ->
      if err return alert err.reason
      Router.go 'postPage', result._id
