
function GoogleMap(){

    var directionsService = new google.maps.DirectionsService();
    var map;
    var directionsDisplay;

    this.initialize = function(lat, lng) {
        directionsDisplay = new google.maps.DirectionsRenderer();
        var start_location = new google.maps.LatLng(lat, lng);
        var mapOptions = {
            zoom:13,
            center: start_location
        };
        map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
        directionsDisplay.setMap(map);
    }

    this.calcRoute = function(lat_end, long_end) {
        var start = new google.maps.LatLng(start_lat, start_lng);
        var end = new google.maps.LatLng(lat_end, long_end);
        var request = {
            origin:start,
            destination:end,
            travelMode: google.maps.TravelMode.WALKING
        };
        directionsService.route(request, function(response, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                directionsDisplay.setDirections(response);
            }
        });
    }
}




