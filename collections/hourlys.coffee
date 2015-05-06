@Hourlys = new Meteor.Collection('hourlys');

Schemas.Hourlys = new SimpleSchema
	deviceId: 
		type: String
	uploadTime:
		type: Date
	airtemp: 
		type: Number
		decimal:true
	airhumidity: 
		type: Number
		decimal:true
	atmosphericpressure: 
		type: Number
		decimal:true
	illumination: 
		type: Number
		optional:true
		decimal:true
	soiltemp: 
		type: Number
		decimal:true
	soilhumidity: 
		type: Number
		decimal:true
	windspeed: 
		type: Number
		decimal:true
	winddirection: 
		type: String
		optional:true
	evaporation: 
		type: Number
		optional:true
		decimal:true
	rainfall: 
		type: Number
		decimal:true
	solarradiation: 
		type: Number
		optional:true
		decimal:true
	CO2: 
		type: Number
		optional:true
		decimal:true
	ultraviolet: 
		type: Number
		optional:true
		decimal:true

Hourlys.attachSchema(Schemas.Hourlys)