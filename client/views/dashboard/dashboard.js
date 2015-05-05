Template.posts.helpers({
    isPostsZero: function() {
        return Posts.find().count() === 0;
    }
});

Template.postSubmit.helpers({
    addFieldStepIs: function(step) {
        return Session.get("addFieldStep") === step;
    }
});

Template.cropAdd.helpers({
    cropOptions: function() {
        return _.map(["小麦", "玉米", "水稻", "大豆", "高粱"], function(crop) {
            return {label: "" + crop, value: crop};
        });
    },
    yearOptions: function() {
        return _.map(_.range(new Date().getFullYear(), 2000, -1), function(year) {
            return {label: "" + year, value: year};
        });
    },
    yearValue: function() {
        return new Date().getFullYear();
    },
    SelectOne: function() {
        return TAPi18n.__('SelectOne');
    },
    farmIdValue: function() {
        return this._id;
    }
});

Template.cropView.helpers({
    cropsList: function() {
        return Crops.find();
    }
});

Template.cropEdit.helpers({
    cropsList: function() {
        return Crops.find();
    }
});

Template.postPage.helpers({
    isCropsZero: function() {
        //return Crops.find({year : new Date().getFullYear()}).count() === 0;
        return Crops.find().count() === 0;
    },
    cropsListInMostRecentYear: function() {
        var crops = Crops.find().fetch();
        var crop = _.max(crops, function(crop){ return crop.year;});
        return crop;
    }
});

Template.postEdit.helpers({
    addFieldStepIs: function(step) {
        return Session.get("addFieldStep") === step;
    },
    deletePostTitle: function() {
        return TAPi18n.__('deletePost'); //'删除农场';
    },
    deletePostButtonContent: function() {
        return TAPi18n.__('delete');//'删除';
    },
    deletePostPrompt: function() {
        return TAPi18n.__('confirmDelete');//"你确定要删除本农场？";
    },
});

Template.postEdit.events({
    'click #addFieldClearButton': function(event, template) {
        clearMap();
    },
    'click #addFieldDoneButton': function(event, template) {
        Session.set('addFieldStep', 'sixthStep');
        $("#" + Config.mapDivID).hide();
        $("#submitFarmBtn").toggle();
        var coordinates = _.map(markers, function(m) {
            return m.getLatLng().lng.toFixed(7) + ',' + m.getLatLng().lat.toFixed(7);
        })
        $('[name="geometry"]').val(coordinates.join(';'));
    }
});

Template.autoformModals.events({
    'click button:not(.close)': function() {
        Router.go("/dashboard");
    }
});

Template.postSubmit.events({
    'click #addFieldStartButton': function(event, template) {
        Session.set('addFieldStep', 'secondStep');
    },
    'click #addFieldClearButton': function(event, template) {
        clearMap();
    },
    'click #addFieldDoneButton': function(event, template) {
        Session.set('addFieldStep', 'sixthStep');
        $("#" + Config.mapDivID).hide();
        $("#submitFarmBtn").toggle();
        var coordinates = _.map(markers, function(m) {
            return m.getLatLng().lng.toFixed(7) + ',' + m.getLatLng().lat.toFixed(7);
        })
        $('[name="geometry"]').val(coordinates.join(';'));
    }
});
AutoForm.addHooks(['addPost', 'editPost', 'addCrop'], {
    onSuccess: function(operation, result, template) {
        Router.go("/dashboard");
    }
});

///////////////////////////////////////////////////////////////////////////////
// Map display
$(window).resize(function() {
    var h = $(window).height(),
        offsetTop = 90; // Calculate the top offset
    $mc = $("#" + Config.mapDivID);
    $mc.css('height', (h - offsetTop));
}).resize();
L.Icon.Default.imagePath = '/images';

var clearMap = function() {
    if (polyline) {
        map.removeLayer(polyline);
    }
    if (polygon) {
        map.removeLayer(polygon);
    }
    if (dragableMarker) {
        map.removeLayer(dragableMarker);
        dragableMarker = null;
    }
    if (markers) {
        _.each(markers, function(m) {
            map.removeLayer(m);
        });
        markers = [];
    }
    if (boundary) {
        boundary = [];
    }
    Session.set('addFieldStep', 'firstStep');
};

var map, polyline, dragableMarker, markers = [];
var polygon, boundary = [];
var markerSize = 5;
var midMarkerSize = 3;

var addCircleMarkerNPolyline = function(latlng) {
    geojsonMarkerOptions.radius = markerSize;
    var marker = L.circleMarker([latlng.lat, latlng.lng], geojsonMarkerOptions);
    if (boundary.length > 0) {
        geojsonMarkerOptions.radius = midMarkerSize;
        var lastLatlng = boundary[boundary.length - 1];
        var midMarker = L.circleMarker([(latlng.lat + lastLatlng.lat) * 0.5, (latlng.lng + lastLatlng.lng) * 0.5], geojsonMarkerOptions);
    }
    marker.on('click', onClick);
    if (boundary.length > 0) {
        midMarker.on('click', onClick);
    }
    if (boundary.length > 0) {
        markers.push(midMarker);
        midMarker.addTo(map);
    }
    markers.push(marker);
    marker.addTo(map);
    if (polyline) {
        map.removeLayer(polyline);
    }
    polyline = L.polyline(boundary.concat([latlng]), {
        dashArray: "5, 10",
        color: "#FFF803"
    }).addTo(map);
    boundary.push(latlng);
};

var onClick = function(e) {
    if (Session.get("addFieldStep") === 'fourthStep') {
        if (calculateDistance(boundary[0], e.latlng) < markerSize) {
            Session.set("addFieldStep", 'fifthStep');
            geojsonMarkerOptions.radius = midMarkerSize;
            var lastLatlng = boundary[boundary.length - 1];
            var midMarker = L.circleMarker([(e.latlng.lat + lastLatlng.lat) * 0.5, (e.latlng.lng + lastLatlng.lng) * 0.5], geojsonMarkerOptions);
            markers.push(midMarker);
            midMarker.addTo(map);

            if (polyline) {
                map.removeLayer(polyline);
            }
            polygon = L.polygon(_.map(markers, function(m) {
                return m.getLatLng();
            }), {
                color: 'blue'
            }).addTo(map);
            polygon.on('click', onClick);
            return;
        } else {
            addCircleMarkerNPolyline(e.latlng);
        }
    }

    if (Session.get("addFieldStep") === 'fifthStep') {
        var filtered = _.filter(markers, function(m) {
            return calculateDistance(m.getLatLng(), e.latlng) < markerSize;
        });
        if (filtered.length === 0) {
            return;
        }
        if (dragableMarker) {
            map.removeLayer(dragableMarker);
        }
        dragableMarker = L.marker(e.latlng, {
            draggable: true,
            zIndexOffset: 1000
        });
        dragableMarker.addTo(map);
        dragableMarker.on('drag', function(e) {
            var marker = e.target;
            var position = marker.getLatLng();
            filtered[0].setLatLng(position);
            map.removeLayer(polygon);
            polygon = L.polygon(_.map(markers, function(m) {
                return m.getLatLng();
            }), {
                color: 'blue'
            }).addTo(map);
        });
    }
};
var geojsonMarkerOptions = {
    fillColor: "#FFF803",
    color: "#DDFF03",
    weight: 1,
    opacity: 0.8,
    fillOpacity: 0.8
};

var initialize = function(element, centroid, zoom, features) {
    //boundary = [];
    clearMap();
    /*var normalm = L.tileLayer.chinaProvider('TianDiTu.Normal.Map',{maxZoom:18,minZoom:5}),
        normala = L.tileLayer.chinaProvider('TianDiTu.Normal.Annotion',{maxZoom:18,minZoom:5}),*/
    var imgm = L.tileLayer.chinaProvider('TianDiTu.Satellite.Map', {
            maxZoom: 18,
            minZoom: 5
        }),
        imga = L.tileLayer.chinaProvider('TianDiTu.Satellite.Annotion', {
            maxZoom: 18,
            minZoom: 5
        });
    //var normal = L.layerGroup([normalm,normala]),
    var image = L.layerGroup([imgm, imga]);
    /*  var baseLayers = {
          "影像":image,
           "地图":normal
      }
      var overlayLayers = {
          
      }
    */
    map = L.map(element, {
        scrollWheelZoom: false,
        doubleClickZoom: false,
        boxZoom: false,
        touchZoom: false,
        layers: [image]
    }).setView(new L.LatLng(centroid[0], centroid[1]), zoom);
    var geocoder = L.Control.Geocoder.nominatim();
    var control = L.Control.geocoder({
        geocoder: geocoder
    }).addTo(map);
    map.addControl(new L.Control.Gps({
        autoActive: true
    }));
    // L.control.layers(baseLayers,overlayLayers).addTo(map);
    //  L.control.zoom({zoomInTitle:'放大', zoomOutTitle:'缩小'}).addTo(map);

    //L.tileLayer('http://{s}.tile.stamen.com/toner/{z}/{x}/{y}.png', {opacity: .5}).addTo(map);

    map.attributionControl.setPrefix('');
    /*
    var attribution = new L.Control.Attribution();
    attribution.addAttribution("Geocoding data &copy; 2013 <a href='http://open.mapquestapi.com'>MapQuest, Inc.</a>");
    attribution.addAttribution("Map tiles by <a href='http://stamen.com'>Stamen Design</a> under <a href='http://creativecommons.org/licenses/by/3.0'>CC BY 3.0</a>.");
    attribution.addAttribution("Data by <a href='http://openstreetmap.org'>OpenStreetMap</a> under <a href='http://creativecommons.org/licenses/by-sa/3.0'>CC BY SA</a>.");
  
    map.addControl(attribution);
    */
    /*map.on("dblclick", function(e) {
      if (! Meteor.userId()) // must be logged in to create parties
        return;
      if (boundary.length >= 2) {
        boundary.push(e.latlng);

        openCreateDialog({center: calculateCenter(boundary), boundary: boundary, area: calculateArea([_.map(boundary, function(latlng) {return [latlng.lat, latlng.lng];})])});
        boundary = [];        
        return;
      }
      boundary.push(e.latlng);
    });
    */
    map.on("click", function(e) {
        if (!Meteor.userId())
            return;

        if (Session.get("addFieldStep") === 'firstStep') {
            return;
        }
        if (Session.get("addFieldStep") === 'secondStep') {
            if (boundary.length == 1) {
                Session.set("addFieldStep", 'thirdStep');
            }
            addCircleMarkerNPolyline(e.latlng);
            return;
        }
        if (Session.get("addFieldStep") === 'thirdStep') {
            if (boundary.length == 2) {
                Session.set("addFieldStep", 'fourthStep');
            }
            addCircleMarkerNPolyline(e.latlng);
            return;
        }
        onClick(e);
    });
}

var calculateDistance = function(fromLatlng, toLatlng) {
    var from = map.latLngToContainerPoint(fromLatlng);
    var to = map.latLngToContainerPoint(toLatlng);
    var distance = Math.abs(from.x - to.x) + Math.abs(from.y - to.y);
    return distance;
};

Template.map.created = function() {
    Posts.find({}).observe({
        added: function(party) {
            /*
            var marker = new L.Marker(party.latlng, {
              _id: party._id,
              icon: createIcon(party)
            }).on('click', function(e) {
              Session.set("selected", e.target.options._id);
            });      
            addMarker(marker);
            */
        },
        changed: function(party) {
            //var marker = markers[party._id];
            //if (marker) marker.setIcon(createIcon(party));
        },
        removed: function(party) {
            //removeMarker(party._id);
        }
    });
};

Template.map.rendered = function() {
    $(window).resize(function() {
        var h = $(window).height(),
            offsetTop = 90; // Calculate the top offset
        $("#" + Config.mapDivID).css('height', (h - offsetTop));
    }).resize();


    if (Template.parentData(1)) {
        var boundaryString = Template.parentData(1).geometry;
        var coordinates = _.map(boundaryString.split(';'), function(lnglatStr) {
            return _.map(lnglatStr.split(','), function(latOrLng) {
                return parseFloat(latOrLng);
            });
        });
        var latFun = function(total, latlng) {return total + latlng[1];}
        var lngFun = function(total, latlng) {return total + latlng[0];}
        var center = {
            lat: _.reduce(coordinates, latFun, 0.0) / coordinates.length,
            lng: _.reduce(coordinates, lngFun, 0.0) / coordinates.length
        };
        var zoomLevel = 15;
        initialize($("#" + Config.mapDivID)[0], [center.lat, center.lng], zoomLevel);
        coordinates = coordinates.concat([coordinates[0]]);
        //clearMap();
        //map.fitBounds(_.map(coordinates, function(lnglat) { return [lnglat[1], lnglat[0]]; }));
        Session.set("addFieldStep", "fifthStep");
        polygon = L.polygon(_.map(coordinates, function(coor) {
            return {
                lat: coor[1],
                lng: coor[0]
            };
        }), {
            color: 'blue'
        }).addTo(map);
        polygon.on('click', onClick);

        markers = _.map(_.range(coordinates.length - 1), function(i) {
            var coor = coordinates[i];
            geojsonMarkerOptions.radius = (i % 2 === 0) ? markerSize : midMarkerSize;
            var latlng = {
                lat: coor[1],
                lng: coor[0]
            };
            var marker = L.circleMarker([latlng.lat, latlng.lng], geojsonMarkerOptions);
            return marker;
        });
        _.each(markers, function(marker) {
            marker.on('click', onClick);
            marker.addTo(map);
        });
    } else {
        initialize($("#" + Config.mapDivID)[0], [Config.defaultLatitude, Config.defaultLongitude], Config.defaultZoomLevel);
    }
};

Template.map.helpers({
    divID: function() {
        return Config.mapDivID;
    }
});
