(function(){
	"use strict";
		
				document.addEventListener('DOMContentLoaded', function(){

		});// DOM Content Loaded
})();


$(function(){

	//Menu responsive
	$("#boton-menu").click(function(){
		$(this).next().slideToggle();
	});

	$(document).ready(function(){
		$(".flexslider").flexslider({
			prevText: "",
			nextText: "",
			pauseOnAction: false,
			slideshowSpeed: 5000
		});
	});

	
});


  		





