
function GoogleMap(){

    var map;
    var directionsService = new google.maps.DirectionsService();
    var directionsDisplay = new google.maps.DirectionsRenderer();

    this.start_location = null,
    this.mapOptions = {
        zoom: 13,
        center: this.start_location
    }

    this.addMaptoPage = function(){
        map = new google.maps.Map(document.getElementById('map-canvas'), this.mapOptions);
        directionsDisplay.setMap(map);
    },

    this.calcRoute = function(lat_end, long_end) {

        var end = new google.maps.LatLng(lat_end, long_end);
        var request = {
            origin: this.start_location,
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

GoogleMap.prototype.initialize = function(lat, lng) {
    this.start_location = new google.maps.LatLng(lat, lng);
}





