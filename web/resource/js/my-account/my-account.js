//add event to toggle tab and set the first tab to show
//need tab-toggle.js
addTabToggleEvent('post'); //add event
$('#tab-post').trigger('click'); //choose begin tab

//add event for button to create-post
//need multipart-form.js
$('#create-post-button').on('click', function(){
    if(validate()) sendFormData('create-post', new FormData($('#create-post-form')[0])); //send form data
    clearForm();
});

//add event for all delete button
$('.delete-button').on('click', function(){
    $('#delete-modal').data('delete-id', $(this).data('id'));
    console.log($('#delete-modal').data());
});

$('.delete-button button').on('click', function(){
   if($(this).data('action') === 'accept'){
       senData
   }
   
   $('.delete-button button').removeData('delete-id'); //clear data delete-id before finish
});