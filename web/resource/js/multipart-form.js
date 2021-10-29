function sendFormData(url, formdata){
    
//    const formdata = new FormData($('#form-id')[0]);
    
jQuery.ajax({
    url: url,
    data: formdata, 
    cache: false,
    contentType: false,
    processData: false,
    method: 'POST',
    type: 'POST', // For jQuery < 1.9
    success: function(response){
        alert(response);
    }
});
}

function sendData(url, data){
    
//    const data = {
//        item1 : itemValue1,
//        item2 : itemValue2
//    }
    
jQuery.ajax({
    url: url,
    data: data,
    cache: false,
    contentType: false,
    processData: false,
    method: 'POST',
    type: 'POST', // For jQuery < 1.9
    success: function(response){
        alert(response);
    }
});
}