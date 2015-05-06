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
  console.log(Devices.find().fetch());
  device = Devices.findOne()
  console.log(device);
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
        Meteor.subscribe 'hourlys', {deviceId:Session.get("currentDeviceId"), options: {fields: {airtemp: 1, uploadTime: 1}, sort: {uploadTime: -1}, limit: 36}}
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "airTemp72Hours",
    path: "/posts/:_id/airTemp72Hours"
    waitOn: ->
      [
        Meteor.subscribe 'hourlys', {deviceId: Session.get("currentDeviceId"), options: {fields: {airtemp: 1, uploadTime: 1}, sort: {uploadTime: -1}, limit: 72}}
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "soilTemp36Hours",
    path: "/posts/:_id/soilTemp36Hours"
    waitOn: ->
      [
        Meteor.subscribe 'hourlys', {deviceId:Session.get("currentDeviceId"), options: {fields: {soiltemp: 1, uploadTime: 1}, sort: {uploadTime: -1}, limit: 36}}
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "soilTemp72Hours",
    path: "/posts/:_id/soilTemp72Hours"
    waitOn: ->
      [
        Meteor.subscribe 'hourlys', {deviceId: Session.get("currentDeviceId"), options: {fields: {soiltemp: 1, uploadTime: 1}, sort: {uploadTime: -1}, limit: 72}}
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "rainfall36Hours",
    path: "/posts/:_id/rainfall36Hours"
    waitOn: ->
      [
        Meteor.subscribe 'hourlys', {deviceId:Session.get("currentDeviceId"), options: {fields: {rainfall: 1, uploadTime: 1}, sort: {uploadTime: -1}, limit: 36}}
      ]
    data: ->
      Posts.findOne(this.params._id)

  @route "rainfall72Hours",
    path: "/posts/:_id/rainfall72Hours"
    waitOn: ->
      [
        Meteor.subscribe 'hourlys', {deviceId: Session.get("currentDeviceId"), options: {fields: {rainfall: 1, uploadTime: 1}, sort: {uploadTime: -1}, limit: 72}}
      ]
    data: ->
      Posts.findOne(this.params._id)
