errorsKey = 'commentSubmitErrors'

Template.commentSubmit.helpers
  errorClass: (field) ->
    if Session.get(errorsKey)[field] then 'has-error' else ''

  errorMessage: (field) ->
    Session.get(errorsKey)[field]

Template.commentSubmit.created = ->
  Session.set errorsKey, {}

Template.commentSubmit.events
  'submit form': (e, template) ->
    e.preventDefault()

    body = $(e.target).find '#body'
    comment =
      body: body.val()
      postId: template.data._id

    errors = {}

    if not comment.body
      errors.body = 'Please write some content'
      return Session.set errorsKey, errors

    Meteor.call 'commentInsert', comment, (err, commentId) ->
      return Errors.throw err.reason if err

      body.val ''
