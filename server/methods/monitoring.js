var apiCall = function(apiUrl, callback) {
    // try…catch allows you to handle errors 

    try {
        var response = HTTP.get(apiUrl).data;
        // A successful API call returns no error 
        // but the contents from the JSON response
        callback(null, response);
    } catch (error) {
        // If the API responded with an error message and a payload 
        if (error.response) {
            var errorCode = error.response.data.code;
            var errorMessage = error.response.data.message;
            // Otherwise use a generic error message
        } else {
            var errorCode = 500;
            var errorMessage = 'Cannot access the API';
        }
        // Create an Error object and return it via callback
        var myError = new Meteor.Error(errorCode, errorMessage);
        callback(myError, null);
    }
};

Meteor.methods({
    'getMonitoringData': function(latlng) {
        this.unblock();
        var lat = latlng.coordinates[1];
        var lng = latlng.coordinates[0];
        var apiUrl = 'http://117.78.4.58:3000/api/data/4028cf814ca1f831014ca1fbcb980001/' + lat + ',' + lng;
        // asynchronous call to the dedicated API calling function
        var response = Meteor.wrapAsync(apiCall)(apiUrl);
        return response;
    }
});
Meteor.methods({
    'getForecastingData': function(latlng) {
        this.unblock();
        var lat = latlng.coordinates[1];
        var lng = latlng.coordinates[0];
        var apiUrl = 'https://api.forecast.io/forecast/0e5a9a380119f9b39ba5fc18efdff39b/' + lat + ',' + lng;
        // asynchronous call to the dedicated API calling function
        var response = Meteor.wrapAsync(apiCall)(apiUrl);
        return response;
    }
});