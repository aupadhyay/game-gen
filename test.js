$(document).ready(function() {
    var options = { 
        target:        '#rt-container', 
        success:       showResponse  
    }; 

    $('#form').ajaxForm(options);
    
    function showResponse(formData, jqForm, options){
        alert("ok!");

    }

});