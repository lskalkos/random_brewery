$(document).ready(function(){

  function getLocation() {
    var longitude, latitude;

    navigator.geolocation.getCurrentPosition(function(position){
      latitude = position.coords.latitude;
      longitude = position.coords.longitude;
      $("#latitude").val(eval(latitude));
      $("#longitude").val(eval(longitude));
    });
  }

  getLocation();
 

});