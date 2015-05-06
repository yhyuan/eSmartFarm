if ( Meteor.users.find().count() === 0 ) {
    Accounts.createUser({
        username: 'yyh',
        email: 'yhyuan@gmail.com',
        password: '1234567',
        profile: {
            first_name: 'fname',
            last_name: 'lname',
            company: 'company',
        }
    });
    Accounts.createUser({
        username: 'yyh1',
        email: 'yyh123@gmail.com',
        password: '1234567',
        profile: {
            first_name: 'fname',
            last_name: 'lname',
            company: 'company',
        }
    });
}

if ( Devices.find().count() === 0 ) {
    Devices.insert({
        deviceName: "育种基地",
        deviceId: '18801415650',
        location: {
            "type": "Point",
            "coordinates": [
                117.480556,
                39.762778
            ]
        }
    });
    Devices.insert({
        deviceName: "水稻园",
        deviceId: '18811799742',
        location: {
            "type": "Point",
            "coordinates": [
                117.533333,
                39.552500
            ]
        }
    });
    Devices.insert({
        deviceName: "育种基地",
        deviceId: '18801415650',
        location: {
            "type": "Point",
            "coordinates": [
                117.457500,
                39.618611
            ]
        }
    });
}

