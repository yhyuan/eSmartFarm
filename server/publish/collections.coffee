Meteor.publish 'posts', ->
	Posts.find owner : this.userId

Meteor.publish 'attachments', ->
	Attachments.find()