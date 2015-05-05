@Activities = new Meteor.Collection('activities');

Schemas.Activities = new SimpleSchema
	name:
		type:String
		label:  ->
			TAPi18n.__ 'name'
	date: 
		type: Date
		label:  ->
			TAPi18n.__ 'date'

	cropYear:
		type:String
		label:  ->
			TAPi18n.__ 'crops'

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

Activities.attachSchema(Schemas.Activities)