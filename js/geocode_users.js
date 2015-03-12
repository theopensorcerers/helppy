var geocoder;
var map;
var markers = [];
var locations = [];

var geometry;

function initialize() {
    geocoder = new google.maps.Geocoder();
    var mapOptions = {
        center: {
            lat: 55.946076,
            lng: -3.200534
        },
        zoom: 12
    }
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

    if (locations.length > 0) {
        for (var i = locations.length - 1; i >= 0; i--) {
            map.data.addGeoJson(locations[i]);
        };
    }
}


// Add a marker to the map and push to the array.
function addMarker(location) {
    var marker = new google.maps.Marker({
        position: location,
        map: map
    });
    markers.push(marker);
}

// Sets the map on all markers in the array.
function setAllMap(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
    }
}

// Removes the markers from the map, but keeps them in the array.
function clearMarkers() {
    setAllMap(null);
}

// Shows any markers currently in the array.
function showMarkers() {
    setAllMap(map);
}

// Deletes all markers in the array by removing references to them.
function deleteMarkers() {
    clearMarkers();
    markers = [];
}


function codeAddress(username) {
    deleteMarkers();
    var address = $('#postcode').val();
    geocoder.geocode({
        'address': address
    }, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            geometry = results[0].geometry;

            // create a GeoJSON feature
            var spatial = "{\"type\": \"Feature\",\"geometry\": {\"type\": \"Point\",\"coordinates\": [" +
                geometry.location.D + ", " +
                geometry.location.k + "]}}";

            // pass it to the form
            $("#spatial").val(spatial);
            // create a MySQL POINT object (which could replace the GeoJSON one if it works)
            $("#point").val("POINT("+geometry.location.D+" "+geometry.location.k+")");

            addMarker(geometry.location);

            $("#user_location_form").submit();

        } else {
            $("#alerts").html('<div class="alert alert-danger alert-dismissible" role="alert"><strong>Unable to geocode this address</strong><br>' + 
            	status +
            	'<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>');
        }
    });
}

google.maps.event.addDomListener(window, 'load', initialize);
