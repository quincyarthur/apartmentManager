$(document).ready(function(){

	hide_search();

	//rails turbolinks doesnt reload the entire page almost like a SPA so this event is necessary
	//if someone clicks the homepage link
	$(document).on("change", "#select_search_type", function(){ 
		select_search();
	});

	$(document).on("page:load", function(){
			hide_search();
	});

	function select_search() {
		if ($("#select_search_type option:selected").text() == "Residential Properties"){
			$("#commercial_properties_search").hide();
			$("#residential_properties_search").show();
		}
		else if ($("#select_search_type option:selected").text() == "Commercial Properties"){
			$("#commercial_properties_search").show();
			$("#residential_properties_search").hide();
		}
		else{
			hide_search();
		}
	}

	function hide_search(){
		$("#commercial_properties_search").hide();
		$("#residential_properties_search").hide();
	}
});