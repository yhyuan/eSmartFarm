Meteor.publish 'posts', ->
	Posts.find owner : this.userId

Meteor.publish 'crops', (farmId) ->
	Crops.find farmId : farmId

Meteor.publish 'activities', (farmId) ->
	Activities.find farmId : farmId

Meteor.publish 'yields', (farmId) ->
	Yields.find farmId : farmId

Meteor.publish 'devices',  (pt)->
	if (pt)
		Devices.find
			location:
				$near:
					$geometry:
						type: 
							"Point"
						coordinates:
							[ pt.coordinates[0], pt.coordinates[1] ]
					$minDistance: 0
					$maxDistance: 15000
	else
		Devices.find()
Meteor.publish 'hourlys',(param) ->
	Hourlys.find 
		deviceId : param.deviceId
		param.options

Meteor.publish 'attachments', ->
	Attachments.find()