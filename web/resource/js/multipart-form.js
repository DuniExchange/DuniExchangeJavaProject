function sendFormData(url, formdata){
    jQuery.ajax({
    url: url,
    data: formdata,
    cache: false,
    contentType: false,
    processData: false,
    method: 'POST',
    type: 'POST', // For jQuery < 1.9
    success: function(data){
        alert(data);
    }
});
}