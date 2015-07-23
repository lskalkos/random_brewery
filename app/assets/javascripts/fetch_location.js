$(document).ready(function(){

  var dots;

  getLocation();
  setInterval(addDots, 250);

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

function addDots(){
  if(dots < 3){
    $("#dots").append('.');
      dots++;
    }
  else{
    $("#dots").empty();
      dots = 0;
    }
};

function getLocation() {
  var longitude, latitude;

  navigator.geolocation.getCurrentPosition(function(position){
    latitude = position.coords.latitude;
    longitude = position.coords.longitude;
    $("#brewery_latitude").val(eval(latitude));
    $("#brewery_longitude").val(eval(longitude));
    $("#beer-form").show();
    $("h3").hide();
  });
}