//add event to toggle tab and set the first tab to show
//need tab-toggle.js
addTabToggleEvent('post'); //add event
$('#tab-post').trigger('click'); //choose begin tab

//add event for button to create-post
//need multipart-form.js
$('#create-post-button').on('click', function(){
    if(validate('create')){
        sendFormData('create-post', new FormData($('#create-post-form')[0])); //send form data
        clearForm('create');
    }
});

//add event for all delete button
$('.delete-button').on('click', function(){        
    let currentActivePost = $(this).closest('.post'); //get .post element contain this button
    console.log(currentActivePost.data());
    
    //add event for button of modal
    $('#delete-modal button').on('click', function(){
        console.log($(this).data('action'));
        console.log(currentActivePost.data(), ' in event');

        if($(this).data('action') === 'accept'){
            sendData('delete-post', {deletePostID: currentActivePost.data('id')}).done(function(){
                    currentActivePost.remove(); //remove the element after the delete request done
            });
        }
        
        $('#delete-modal button').off('click'); //remove button click event before finish
        
        console.log('delete id ' + currentActivePost.data('id'));
    });
});

//add event for all edit button
$('.edit-button').on('click', function(){    
    let currentActivePost = $(this).closest('.post'); //get .post element contain this button
    console.log(currentActivePost.data());
    
    $('#edit-modal .loading-placeholder').html('Loading...').show();
    $('#edit-modal .form-container').hide();
    
    let loadingEditXHR = getJsonJqXHR('get-postinfo', {editPostID: currentActivePost.data('id')}).done(function(jsonObj){
        console.log(jsonObj);
        
        if(jsonObj.success){
            $('#edit-title').val(jsonObj.post.postTitle);
            //uncheck all checkbox first
            $(`#edit-category-items input`).each(function(){
                this.checked = false;
            });
            //checked all checkbox have same id with categories' id in post Json object
            for(const category of jsonObj.post.categories){
                $(`#edit-category-items input[data-id="${category}"]`)[0].checked = true;
            }
            $('#edit-description').html(jsonObj.post.postDescription);
            
            //hide loading and show form
            $('#edit-modal .loading-placeholder').html('').hide();
            $('#edit-modal .form-container').show();
        }
    });
    
    //add event for button of modal
    $('#edit-modal button').on('click', function(e){
        console.log($(this).data('action'));
        
        if($(this).data('action') === 'accept'){
            let formData = new FormData($('#edit-post-form')[0]);
            formData.append('postID', currentActivePost.data('id'));
            
            sendFormData('edit-post', formData).done(function(){
                loadUpdatePost(currentActivePost); //after send success, update post
            });
        } else if ($(this).data('action') === 'cancel'){
            loadingEditXHR.abort();
        }        
        $('#edit-modal button').off('click'); //remove button click event before finish

        console.log('edit id ' + currentActivePost.data('id'));
    });
});

function loadUpdatePost(updatePost){
    getJsonJqXHR('get-postinfo', {editPostID: updatePost.data('id')}).done(function(jsonObj){
        console.log(jsonObj);
        
        if(jsonObj.success){
            updatePost.find('.imgp img').attr('src', jsonObj.post.postThumbnailURL);
            //uncheck all checkbox first
            $(`#edit-category-items input`).each(function(){
                this.checked = false;
            });
            //checked all checkbox have same id with categories' id in post Json object
            for(const category of jsonObj.post.categories){
                $(`#edit-category-items input[data-id="${category}"]`)[0].checked = true;
            }
            $('#edit-description').html(jsonObj.post.postDescription);
            
            //hide loading and show form
            $('#edit-modal .loading-placeholder').html('').hide();
            $('#edit-modal .form-container').show();
        }
    });
}