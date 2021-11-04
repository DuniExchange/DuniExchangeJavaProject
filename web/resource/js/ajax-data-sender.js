function sendFormData(url, formdata){
    
//    const formdata = new FormData($('#form-id')[0]);
    console.log(formdata);

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
            alert(errorThrown + ' ' + textStatus);
            return false;
        }
    });
}

function sendData(url, data, successHandle, errorHandle){
    console.log('send ', data, ' to ' + url);

    return $.ajax({
        url: url,
        data: data,
        method: 'POST',
        type: 'POST', // For jQuery < 1.9
        success: successHandle,    
        error: errorHandle
    });
}

function getJsonJqXHR(url, data, successHandle, errorHandle){
    console.log('send ', data, ' to ' + url);

    return $.ajax({
        url: url,
        data: data,
        dataType: 'json',
        method: 'POST',
        type: 'POST', // For jQuery < 1.9
        success: successHandle,    
        error: errorHandle
    });
    
    
}