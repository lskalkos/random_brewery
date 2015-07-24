$(document).ready(function(){

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


