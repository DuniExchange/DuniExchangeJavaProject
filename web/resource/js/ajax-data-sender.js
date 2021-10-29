function sendFormData(url, formdata){
    
//    const formdata = new FormData($('#form-id')[0]);

    return $.ajax({
        url: url,
        data: formdata, 
        cache: false,
        contentType: false,
        processData: false,
        method: 'POST',
        type: 'POST', // For jQuery < 1.9
        success: function(response){
            alert(response);
            return true;
        },
        error: function(jqXHR, textStatus, errorThrown){
            alert(errorThrown);
            return false;
        }
    });
}

function sendData(url, data){
    console.log('send ', data, ' to ' + url);

    return $.ajax({
        url: url,
        data: data,
        method: 'POST',
        type: 'POST', // For jQuery < 1.9
        success: function(response, textStatus, jqXHR){
            alert(response);
        },    
        error: function(jqXHR, textStatus, errorThrown){
            alert(errorThrown);
        }
    });
}