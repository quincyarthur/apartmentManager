$(document).ready(function(){

	$(document).on("click","#show_login", function(){
		showpopup();
	});
   
   $(document).on("click","#close_login", function(){
		hidepopup();
	});

});

function showpopup()
{
   $("#loginform").fadeIn();
   $("#loginform").css({"visibility":"visible","display":"block"});
}

function hidepopup()
{
   $("#loginform").fadeOut();
   $("#loginform").css({"visibility":"hidden","display":"none"});
}