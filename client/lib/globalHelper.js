Template.registerHelper("calculateArea", function(boundaryString) {
    var coords = _.map(boundaryString.split(';'), function(lnglatStr) {
        return _.map(lnglatStr.split(','), function(latOrLng) {
            return parseFloat(latOrLng);
        });
    });
    coords = coords.concat([coords[0]]);
    
    var RADIUS = 6378137; //wgs84
    /**
     * Calculate the approximate area of the polygon were it projected onto
     *     the earth.  Note that this area will be positive if ring is oriented
     *     clockwise, otherwise it will be negative.
     *
     * Reference:
     * Robert. G. Chamberlain and William H. Duquette, "Some Algorithms for
     *     Polygons on a Sphere", JPL Publication 07-03, Jet Propulsion
     *     Laboratory, Pasadena, CA, June 2007 http://trs-new.jpl.nasa.gov/dspace/handle/2014/40409
     *
     * Returns:
     * {float} The approximate signed geodesic area of the polygon in square
     *     meters.
     */

    var ringArea = function(coords) {
        var area = 0;
        var rad = function(_) {
            return _ * Math.PI / 180;
        };
        if (coords.length > 2) {
            var p1, p2;
            for (var i = 0; i < coords.length - 1; i++) {
                p1 = coords[i];
                p2 = coords[i + 1];
                area += rad(p2[0] - p1[0]) * (2 + Math.sin(rad(p1[1])) + Math.sin(rad(p2[1])));
            }

            area = area * RADIUS * RADIUS / 2;
        }

        return area;
    }

    return (ringArea(coords) / 10000).toFixed(2);
});
