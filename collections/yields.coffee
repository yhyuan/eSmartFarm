@Yields = new Meteor.Collection('yields');

Schemas.Yields = new SimpleSchema
	yields:
		type:Number
		label:  ->
			TAPi18n.__ 'yields'

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

Yields.attachSchema(Schemas.Yields)