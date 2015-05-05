@Crops = new Meteor.Collection('crops');

Schemas.Crops = new SimpleSchema
	crop:
		type:[String]
		label:  ->
			TAPi18n.__ 'crops'
	year: 
		type: Number
		label:  ->
			TAPi18n.__ 'year'

	farmId: 
		type: String
		regEx: SimpleSchema.RegEx.Id

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

Crops.attachSchema(Schemas.Crops)