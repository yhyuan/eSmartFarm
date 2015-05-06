calculateCenter = (_id) ->
  farm = Posts.findOne(_id)
  geometry = farm.geometry
  lnglats = _.map geometry.split(';'), (lnglatString) -> (_.map lnglatString.split(','), (str) -> parseFloat(str))
  avglng = (_.reduce lnglats, ((memo, num) -> memo + num[0]), 0)/lnglats.length
  avglat = (_.reduce lnglats, ((memo, num) -> memo + num[1]), 0)/lnglats.length
  return {
    lng: avglng
    lat: avglat
  }

getDeviceId = () ->
  device = Devices.findOne()
  device.deviceId

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
      [
        Meteor.subscribe 'crops', this.params._id
        Meteor.subscribe 'activities', this.params._id
        Meteor.subscribe 'yields', this.params._id
        Meteor.subscribe 'devices', calculateCenter(this.params._id)
      ]
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

  @route "cropView",
    path: "/posts/:_id/cropView"
    waitOn: ->
      Meteor.subscribe 'crops', this.params._id
    data: ->
      Posts.findOne(this.params._id)

  @route "cropEdit",
    path: "/posts/:_id/cropEdit"
    waitOn: ->
      Meteor.subscribe 'crops', this.params._id
    data: ->
      Posts.findOne(this.params._id)

  @route "activityAdd",
    path: "/posts/:_id/activityAdd"
    waitOn: ->
      [
        Meteor.subscribe 'crops', this.params._id
        Meteor.subscribe 'activities', this.params._id
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "activityView",
    path: "/posts/:_id/activityView"
    waitOn: ->
      [
        Meteor.subscribe 'crops', this.params._id
        Meteor.subscribe 'activities', this.params._id
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "activityEdit",
    path: "/posts/:_id/activityEdit"
    waitOn: ->
      [
        Meteor.subscribe 'crops', this.params._id
        Meteor.subscribe 'activities', this.params._id
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "yieldAdd",
    path: "/posts/:_id/yieldAdd"
    waitOn: ->
      [
        Meteor.subscribe 'crops', this.params._id
        Meteor.subscribe 'yields', this.params._id
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "yieldView",
    path: "/posts/:_id/yieldView"
    waitOn: ->
      [
        Meteor.subscribe 'crops', this.params._id
        Meteor.subscribe 'yields', this.params._id
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "yieldEdit",
    path: "/posts/:_id/yieldEdit"
    waitOn: ->
      [
        Meteor.subscribe 'crops', this.params._id
        Meteor.subscribe 'yields', this.params._id
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "airTemp36Hours",
    path: "/posts/:_id/airTemp36Hours"
    waitOn: ->
      [
        Meteor.subscribe 'hourlys', getDeviceId(this.params._id)
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "airTemp3Days",
    path: "/posts/:_id/airTemp3Days"
    waitOn: ->
      [
        Meteor.subscribe 'hourlys', getDeviceId(this.params._id)
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "airHumidity36Hours",
    path: "/posts/:_id/airHumidity36Hours"
    waitOn: ->
      [
        Meteor.subscribe 'hourlys', getDeviceId(this.params._id)
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "airHumidity3Days",
    path: "/posts/:_id/airHumidity3Days"
    waitOn: ->
      [
        Meteor.subscribe 'hourlys', getDeviceId(this.params._id)
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "atmosphericPressure36Hours",
    path: "/posts/:_id/atmosphericPressure36Hours"
    waitOn: ->
      [
        Meteor.subscribe 'hourlys', getDeviceId(this.params._id)
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "atmosphericPressure3Days",
    path: "/posts/:_id/atmosphericPressure3Days"
    waitOn: ->
      [
        Meteor.subscribe 'hourlys', getDeviceId(this.params._id)
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "soilTemp36Hours",
    path: "/posts/:_id/soilTemp36Hours"
    waitOn: ->
      [
        Meteor.subscribe 'hourlys', getDeviceId(this.params._id)
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "soilTemp3Days",
    path: "/posts/:_id/soilTemp3Days"
    waitOn: ->
      [
        Meteor.subscribe 'hourlys', getDeviceId(this.params._id)
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "soilHumidity36Hours",
    path: "/posts/:_id/soilHumidity36Hours"
    waitOn: ->
      [
        Meteor.subscribe 'hourlys', getDeviceId(this.params._id)
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "soilHumidity3Days",
    path: "/posts/:_id/soilHumidity3Days"
    waitOn: ->
      [
        Meteor.subscribe 'hourlys', getDeviceId(this.params._id)
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "windSpeed36Hours",
    path: "/posts/:_id/windSpeed36Hours"
    waitOn: ->
      [
        Meteor.subscribe 'hourlys', getDeviceId(this.params._id)
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "windSpeed3Days",
    path: "/posts/:_id/windSpeed3Days"
    waitOn: ->
      [
        Meteor.subscribe 'hourlys', getDeviceId(this.params._id)
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "windDirection36Hours",
    path: "/posts/:_id/windDirection36Hours"
    waitOn: ->
      [
        Meteor.subscribe 'hourlys', getDeviceId(this.params._id)
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "windDirection3Days",
    path: "/posts/:_id/windDirection3Days"
    waitOn: ->
      [
        Meteor.subscribe 'hourlys', getDeviceId(this.params._id)
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "rainfall36Hours",
    path: "/posts/:_id/rainfall36Hours"
    waitOn: ->
      [
        Meteor.subscribe 'hourlys', getDeviceId(this.params._id)
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "rainfall3Days",
    path: "/posts/:_id/rainfall3Days"
    waitOn: ->
      [
        Meteor.subscribe 'hourlys', getDeviceId(this.params._id)
      ]
    data: ->
      Posts.findOne(this.params._id)

