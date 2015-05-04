Meteor.publish 'posts', ->
	Posts.find owner : this.userId

Meteor.publish 'crops', (farmId) ->
	Crops.find farmId : farmId

Meteor.publish 'attachments', ->
	Attachments.find()