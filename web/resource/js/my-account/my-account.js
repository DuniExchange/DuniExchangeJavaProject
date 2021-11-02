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
var currentActivePost;
$('.delete-button').on('click', function(){
    $('#delete-modal').data('delete-id', $(this).data('id')); //set data id of this post for #delete-modal
    console.log($('#delete-modal').data());
    currentActivePost = $(this).closest('.post'); //get .post element contain this button
});

$('#delete-modal button').on('click', function(){
    console.log($(this).data('action'));
    
    if($(this).data('action') === 'accept'){
        let jqXHR = sendData('delete-post', {deletePostID: $('#delete-modal').data('delete-id')});
        jqXHR.done(function(msg){
            currentActivePost.remove(); //remove the element after delete request done
        });
    }

    console.log('delete id ' + $('#delete-modal').data('delete-id'));
    $('#delete-modal').removeData('delete-id'); //clear data delete-id before finish
});

//add event for all edit button
var currentActivePost;
$('.edit-button').on('click', function(){
    $('#edit-modal').data('edit-id', $(this).data('id')); //set data id of this post for #edit-modal
    console.log($('#edit-modal').data());
    currentActivePost = $(this).closest('.post'); //get .post element contain this button
    
    let jqXHR = sendData('get-post', {editPostID: $('#edit-modal').data('edit-id')});
});