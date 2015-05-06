@Hourlys = new Meteor.Collection('hourlys');

Schemas.Hourlys = new SimpleSchema
	deviceId: 
		type: String
	uploadTime:
		type: Date
	airtemp: 
		type: Number
	airhumidity: 
		type: Number
	atmosphericpressure: 
		type: Number
	illumination: 
		type: Number
	soiltemp: 
		type: Number
	soilhumidity: 
		type: Number
	windspeed: 
		type: Number
	winddirection: 
		type: String
	evaporation: 
		type: Number
	rainfall: 
		type: Number
	solarradiation: 
		type: Number
	CO2: 
		type: Number
	ultraviolet: 
		type: Number

Hourlys.attachSchema(Schemas.Hourlys)