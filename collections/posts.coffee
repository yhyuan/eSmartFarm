@Posts = new Meteor.Collection('posts');

SimpleSchema.messages
	needsLatLong: '[label] should be of form [longitude, latitude]'
	lonOutOfRange: '[label] longitude should be between -90 and 90'
	latOutOfRange: '[label] latitude should be between -180 and 180'

Schemas.Location = new SimpleSchema
	type:
		type: String,
		allowedValues: ['Point']
	coordinates:
		type: [Number]
		decimal: true
		custom: ->
			return "needsLatLong" unless @value.length is 2
			return "lonOutOfRange" unless -180 <= @value[0] <= 180
			return "latOutOfRange" unless -90 < @value[1] <= 90

calculateCenter = (geometry) ->
	lnglats = _.map geometry.split(';'), (lnglatString) -> (_.map lnglatString.split(','), (str) -> parseFloat(str))
	avglng = (_.reduce lnglats, ((memo, num) -> memo + num[0]), 0)/lnglats.length
	avglat = (_.reduce lnglats, ((memo, num) -> memo + num[1]), 0)/lnglats.length
	return {
		"type": "Point",
		"coordinates": [avglng, avglat]
	}	

Schemas.Posts = new SimpleSchema
	title:
		type:String
		label:  ->
			TAPi18n.__ 'farmName'
		max: 60

	geometry:
		type: String

	center:
		type: Schemas.Location
		index: '2dsphere'
		autoValue: ->
			calculateCenter (this.field('geometry').value)

	content:
		type: String
		label:  ->
			TAPi18n.__ 'farmDescription'
		autoform:
			rows: 2

	createdAt: 
		type: Date
		autoValue: ->
			if this.isInsert
				new Date()

	updatedAt:
		type:Date
		optional:true
		autoValue: ->
			if this.isUpdate
				new Date()

	owner: 
		type: String
		regEx: SimpleSchema.RegEx.Id
		autoValue: ->
			if this.isInsert
				Meteor.userId()
		autoform:
			options: ->
				_.map Meteor.users.find().fetch(), (user)->
					label: user.emails[0].address
					value: user._id

Posts.attachSchema(Schemas.Posts)