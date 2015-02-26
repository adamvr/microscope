if Posts.find().count() is 0
  now = new Date().getTime()

  # Create dummy users
  wintermuteId = Meteor.users.insert
    profile:
      name: 'Wintermute'

  wintermute = Meteor.users.findOne wintermuteId

  neuromancerId = Meteor.users.insert
    profile:
      name: 'Neuromancer'

  neuromancer = Meteor.users.findOne neuromancerId

  icarusId = Meteor.users.insert
    profile:
      name: 'Icarus'

  icarus = Meteor.users.findOne icarusId

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

  Subscriptions.insert
    userId: neuromancer._id
    subscribedId: wintermute._id
    subscribedName: wintermute.profile.name
    subscribedAt: new Date()
    notify: ['post']

  Subscriptions.insert
    userId: wintermute._id
    subscribedId: icarus._id
    subscribedName: icarus.profile.name
    subscribedAt: new Date()
    notify: ['post']
