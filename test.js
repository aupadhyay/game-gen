$(document).ready(function() {
    var options = { 
        target:        '#rt-container',
        beforeSubmit:  showRequest,  
        success:       showResponse  
    }; 

    $('#form').submit(function() { 
        $(this).ajaxSubmit(options); 

        return false; 
    }); 
        
    function showResponse(formData, jqForm, options){
        console.log(recallData['message']);
        console.log(recallData['message1']);

    }

});