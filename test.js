$(document).ready(function() {
    var options = { 
        target:        '#rt-container', 
        success:       showResponse  
    }; 

    $('#form').submit(function() { 
        $(this).ajaxSubmit(options); 

        return false; 
    }); 
        
    function showResponse(formData, jqForm, options){
        alert("ok!");

    }

});