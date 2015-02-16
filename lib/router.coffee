Router.configure
  layoutTemplate: 'layout'
  waitOn: ->
    Meteor.subscribe 'posts'

Router.route '/', name: 'postsList'
