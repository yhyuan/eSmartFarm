@Devices = new Meteor.Collection('devices');

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

Schemas.Devices = new SimpleSchema
	deviceName:
		type: String

	deviceId: 
		type: String

	location:
		type: Schemas.Location
		index: '2dsphere'

Devices.attachSchema(Schemas.Devices)