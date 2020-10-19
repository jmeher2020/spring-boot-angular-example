$(document).ready( function() {


	/*-------------------------------------------------------------------------------
	    Disable right click
	  -------------------------------------------------------------------------------*/
	$(function() {
		$(this).bind("contextmenu", function(e) {
			alert('Sorry, Right click is disabled!');
			e.preventDefault();
		});
	});


	$("#phoneNo,#phone_no,#phone_number").on("keypress", function(evt) {
		if (evt.keyCode==69 || evt.keyCode==101 || this.value.length >=10) {
			return false;
		}
		
		if(evt.charCode < 48 || evt.charCode > 57){
			return false;
		}
	});

	$("#phoneNo,#phone_no,#phone_number").bind("paste", function(e){
		e.stopPropagation();
		e.preventDefault();
		var clipData = e.originalEvent.clipboardData.getData("text/plain");
		if(clipData && clipData.length ===10){
			$(this).val(clipData);
		}	
	});



	$("#phoneNo,#phone_no,#phone_number").on("change", function(evt) {

		if (this.value.charAt(0) === "0") {
			this.value=this.value.substring(1, this.value.length);
		}

		if (this.value.length >=10) {
			this.value=this.value.substring(0, 10);
		}


		if (this.value.length != 0 && this.value.length < 10){
			$(this)[0].setCustomValidity("Mobile No can not be less then 10 digit! ");
		}
		else
			$(this)[0].setCustomValidity("");
	});
	
	
	$("#postalCode,#postal_code,#pin_code").on("keypress", function(evt) {
		if (evt.keyCode==69 || evt.keyCode==101 || this.value.length >=6) {
			return false;
		}
		
		if(evt.charCode < 48 || evt.charCode > 57){
			return false;
		}
	});
	

	$("#postalCode,#postal_code,#pin_code").bind("paste", function(e){
		e.stopPropagation();
		e.preventDefault();
		var clipData = e.originalEvent.clipboardData.getData("text/plain");
		if(clipData && clipData.length ===6){
			$(this).val(clipData);
		}	
	});



	$("#postalCode,#postal_code,#pin_code").on("change", function(evt) {

		if (this.value.charAt(0) === "0") {
			this.value=this.value.substring(1, this.value.length);
		}

		if (this.value.length >=6) {
			this.value=this.value.substring(0, 6);
		}


		if (this.value.length != 0 && this.value.length < 6){
			$(this)[0].setCustomValidity("Pin Code  can not be less then 6 digit! ");
		}
		else
			$(this)[0].setCustomValidity("");
	});

});












