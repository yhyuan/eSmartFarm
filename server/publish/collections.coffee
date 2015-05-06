Meteor.publish 'posts', ->
	Posts.find owner : this.userId

Meteor.publish 'crops', (farmId) ->
	Crops.find farmId : farmId

Meteor.publish 'activities', (farmId) ->
	Activities.find farmId : farmId

Meteor.publish 'yields', (farmId) ->
	Yields.find farmId : farmId

Meteor.publish 'devices',  (latlng)->
	Devices.find
		location:
			$near:
				$geometry:
					type: 
						"Point"
					coordinates:
						[ latlng.lng, latlng.lat ]
				$minDistance: 0
				$maxDistance: 15000

Meteor.publish 'hourlys', (deviceId) ->
	Hourlys.find deviceId : deviceId

Meteor.publish 'attachments', ->
	Attachments.find()