if Posts.find().count() is 0
  Posts.insert
    title: 'Introducing Microscope'
    url: 'http://saschagreif.com/introducing-microscope'

  Posts.insert
    title: 'Meteor'
    url: 'http://meteor.com'

  Posts.insert
    title: 'The Meteor Book'
    url: 'http://themeteorbook.com'

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

  telescopeId = Posts.insert
    title: 'Introducting Telescope'
    url: 'http://saschagreif.com/introducing-telescope'
    userId: wintermute._id
    author: wintermute.profile.name
    submitted: new Date now - 7 * 3600 * 1000

  Comments.insert
    postId: telescopeId
    userId: neuromancer._id
    author: neuromancer.profile.name
    submitted: new Date now - 7 * 3600 * 1000
    body: 'Message'
