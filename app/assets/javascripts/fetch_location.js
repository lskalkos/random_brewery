
$(document).ready(function(){

  function getLocation() {
    var longitude, latitude;

    navigator.geolocation.getCurrentPosition(function(position){
      latitude = position.coords.latitude;
      longitude = position.coords.longitude;
      $("#brewery_latitude").val(eval(latitude));
      $("#brewery_longitude").val(eval(longitude));
      $("#beer-form").show();
      $("h3").hide();
      // initialize(latitude, longitude);
    });
  }

  getLocation();

  $("form").submit(function(event){

    event.preventDefault();
    var data = $(this).serializeArray();
    var method = $(this).attr("method"); 
    var url = $(this).attr("action");
    $.ajax({
      method: method,
      url: url,
      data: data,
      dataType: "script"
      }); 
    });

 

});