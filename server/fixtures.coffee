if Posts.find().count() is 0
  now = new Date().getTime()

  ['Wintermute', 'Neuromancer', 'Icarus', 'Helios'].forEach (x) ->
    Meteor.users.insert
      username: x
      profile:
        name: x

  wintermute = Meteor.users.findOne username: 'Wintermute'
  neuromancer = Meteor.users.findOne username: 'Neuromancer'
  icarus = Meteor.users.findOne username: 'Icarus'
  helios = Meteor.users.findOne username: 'Helios'

  telescopeId = Posts.insert
    title: 'Introducting Telescope'
    url: 'http://saschagreif.com/introducing-telescope'
    userId: wintermute._id
    author: wintermute.profile.name
    submitted: new Date now - 7 * 3600 * 1000
    commentsCount: 1

  Comments.insert
    postId: telescopeId
    userId: neuromancer._id
    author: neuromancer.profile.name
    submitted: new Date now - 7 * 3600 * 1000
    body: 'Message'

  Posts.insert
    title: 'Introducing Microscope'
    url: 'http://saschagreif.com/introducing-microscope'
    userId: icarus._id
    author: icarus.profile.name
    submitted: new Date()
    commentsCount: 0

  Posts.insert
    title: 'Meteor'
    userId: wintermute._id
    author: wintermute.profile.name
    submitted: new Date()
    url: 'http://meteor.com'
    commentsCount: 0

  Posts.insert
    title: 'The Meteor Book'
    url: 'http://themeteorbook.com'
    userId: neuromancer._id
    author: neuromancer.profile.name
    submitted: new Date()
    commentsCount: 0

  createSubscription neuromancer, wintermute
  createSubscription wintermute, icarus
  createSubscription icarus, helios
  createSubscription helios, neuromancer
  createSubscription helios, icarus
