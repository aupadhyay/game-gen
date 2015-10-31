$(document).ready(function() {
    $('form').submit(function(event) {

        var formData = {
            'titleText': $('input[name=titleText]').val(),
            'testImage': $('input[name=lastname]').val(),
        };

        
        $.ajax({
            type        : 'POST',
            url         : 'process.php',
            data        : formData,
            dataType    : 'json',
            encode      : true
        })
        
            .done(function(recallData) {

                var rtElements = [
                    document.getElementById("titleText"),

                ]
                rtElements[0].innerHTML = recallData['titleText'];
                console.log(recallData['message']);
                console.log(recallData['message1']);

            });

        event.preventDefault();
    });

});