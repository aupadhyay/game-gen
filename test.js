$(document).ready(function() {
    $('form').submit(function(event) {

        var formData = {
            'firstname': $('input[name=firstname]').val(),
            'lastname': $('input[name=lastname]').val(),
        };

        
        $.ajax({
            type        : 'POST',
            url         : 'process.php',
            data        : formData,
            dataType    : 'json',
            encode      : true
        })
        
            .done(function(data) {

                document.getElementById("titleText").innerHTML = data['firstname'];
                document.getElementById("titleText").className = "visible"; 
            });

        event.preventDefault();
    });

});