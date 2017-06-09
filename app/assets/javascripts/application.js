// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .


$(document).on('turbolinks:load', function() {



	// controls the parallex scrolling for head_section
	function parallex(){
		var ypos = window.pageYOffset;
		var pic = document.getElementById('head_section');
		pic.style.top = ypos * 0.6 + 'px'; 
	}
	window.addEventListener('scroll', parallex);




	// controls multiple choice uncheck for tests
	function option1_checker(){
		if(document.getElementById('option1_checkbox').checked){
			$('#option2_checkbox').attr('checked', false);
			$('#option3_checkbox').attr('checked', false); 
		}
	}
	var option1 = document.getElementById('option1_checkbox');
	option1.addEventListener('click', option1_checker);

	function option2_checker(){
		if(document.getElementById('option2_checkbox').checked){
			$('#option1_checkbox').attr('checked', false);
			$('#option3_checkbox').attr('checked', false); 
		}
	}
	var option2 = document.getElementById('option2_checkbox');
	option2.addEventListener('click', option2_checker);

	function option3_checker(){
		if(document.getElementById('option3_checkbox').checked){
			$('#option1_checkbox').attr('checked', false);
			$('#option2_checkbox').attr('checked', false); 
		}
	}
	var option3 = document.getElementById('option3_checkbox');
	option3.addEventListener('click', option3_checker);




	// controls true false uncheck for tests
	function false_checker(){
		if(document.getElementById('false_checkbox').checked){
			$('#true_checkbox').attr('checked', false); 
		}
	}
	var false_check = document.getElementById('false_checkbox');
	false_check.addEventListener('click', false_checker);

	function true_checker(){
		if(document.getElementById('true_checkbox').checked){
			$('#false_checkbox').attr('checked', false); 
		}
	}
	var true_check = document.getElementById('true_checkbox');
	true_check.addEventListener('click', true_checker);





});