Router.map ->
  @route "home",
    path: "/"
    layoutTemplate: "homeLayout"
  @route "dashboard",
    path: "/dashboard"
    waitOn: ->
      [
        Meteor.subscribe 'favorites'
        Meteor.subscribe 'comments'
        Meteor.subscribe 'attachments'
      ]
    onBeforeAction: ->
      if not Meteor.user()
        @redirect '/sign-up'
      else
        url = Session.get 'redirectToAfterSignIn'
        if url
          Session.set 'redirectToAfterSignIn', null
          Router.go url
        @next()
    data: ->
      Posts: Posts.find({},{sort: {createdAt: -1}}).fetch()
  @route "profile",
    path: "/profile"
    waitOn: ->
      Meteor.subscribe 'profilePictures'
      
  @route "account",
    path: "/account"

  @route "setUserName",
    path: "/setUserName"
    onBeforeAction: ->
      if not Config.username or (Meteor.userId() and Meteor.user().username)
        @redirect '/dashboard'
      @next()

  @route "postSubmit",
    path: "/postSubmit"

  @route "postPage",
    path: "/posts/:_id"
    waitOn: ->
      Meteor.subscribe 'crops', this.params._id
    data: ->
      Posts.findOne(this.params._id)

  @route "postEdit",
    path: "/posts/:_id/edit"
    data: ->
      Posts.findOne(this.params._id)

  @route "cropAdd",
    path: "/posts/:_id/cropAdd"
    waitOn: ->
      Meteor.subscribe 'crops', this.params._id
    data: ->
      Posts.findOne(this.params._id)