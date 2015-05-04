@Crops = new Meteor.Collection('crops');

Schemas.Crops = new SimpleSchema
	crop:
		type:String
		label:  ->
			TAPi18n.__ 'crops'
	year: 
		type: Number
		label:  ->
			TAPi18n.__ 'year'

	farmId: 
		type: String
		regEx: SimpleSchema.RegEx.Id

Crops.attachSchema(Schemas.Crops)