//add event to toggle tab and set the first tab to show
//need tab-toggle.js
addTabToggleEvent('post'); //add event
$('#tab-post').trigger('click'); //choose begin tab

//add event for button to create post
//need multipart-form.js
$('#create-post-button').on('click', function(){
    if(validate('create')){
        sendFormData('create-post', new FormData($('#create-post-form')[0])).done(function(e){
            alert(e);
        }); //send form data
        clearForm('create');
    }
});

//<ref[1]
$('#delete-modal').on('hide.bs.modal', function(){
   $('#delete-modal button').off('.button.modal'); //remove modal button event in the .modal.button namespace when the modal close
});
//ref[1]>

//add event for all delete button
//need multipart-form.js
$('.delete-button').on('click.delete.post', function(){        
    let currentActivePost = $(this).closest('.post'); //get .post element contain this button
    console.log(currentActivePost.data());
    
    //add event for button of modal in namespace .modal.delete
    //this event will be remove after the modal close, for detail view ref[1]
    $('#delete-modal button').on('click.button.modal', function(){
        console.log($(this).data('action'));
        console.log(currentActivePost.data(), ' in event');

        if($(this).data('action') === 'accept'){
            sendData('delete-post', {deletePostID: currentActivePost.data('id')}).done(function(response){
                alert(response);
                console.log('remove');
                currentActivePost.remove(); //remove the element after the delete request done
            });
        }
        $("#delete-modal").modal('hide');
        console.log('delete id ' + currentActivePost.data('id'));
    });
});

//<ref[2]
$('#edit-modal').on('hide.bs.modal', function(){
   console.log('#edit-modal close');
   $('#edit-modal button').off('.modal.button'); //remove modal button event in the .modal.button namespace when the modal close
});
$('#edit-modal').on('hidden.bs.modal', function(){
    clearForm('edit'); //clear form when modal finish being hidden
});

//ref[2]>

//add event for all edit button
//need multipart-form.js
$('.edit-button').on('click.edit.post', function(){    
    let currentActivePost = $(this).closest('.post'); //get .post element contain this button
    console.log(currentActivePost.data());
    
    $('#edit-modal .loading-placeholder').html('Loading...').show();
    $('#edit-modal .form-container').hide();
    
    //load information of edit post before edit, assign XHR object return from ajax to loadingEditXHR for aborting if modal is close
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
            $('#edit-description').val(jsonObj.post.postDescription);            
            
            //hide loading and show form
            $('#edit-modal .loading-placeholder').html('').hide();
            $('#edit-modal .form-container').show();
        }
    });
    
    //add event for abort ajax request when the modal close
    $('#edit-modal').on('hide.bs.modal.abort', function(){
        loadingEditXHR.abort();
        $('#edit-modal').off('.bs.modal.abort');
    });
    
    //add event click for button of modal in namespace .modal.edit
    //this event will be remove after the modal close, for detail view ref[2]
    $('#edit-modal button').on('click.modal.button', function(e){
        console.log($(this).data('action'));
        
        if($(this).data('action') === 'accept'){
            if(validate('edit', {isCheckFile : false})){
                let formData = new FormData($('#edit-post-form')[0]);
                formData.append('postID', currentActivePost.data('id'));
                
                sendFormData('edit-post', formData).done(function(e){
                    loadUpdatePost(currentActivePost); //after send success, update post
                    alert(e);
                });
            }
        }
        
        $('#edit-modal').modal('hide');
        console.log('edit id ' + currentActivePost.data('id'));
        console.log('end edit modal');       
    });
});

function loadUpdatePost(updatePost){
    console.log('update post ', updatePost);
    getJsonJqXHR('get-postinfo', {editPostID: updatePost.data('id')}).done(function(jsonObj){
        console.log(jsonObj);
        
        if(jsonObj.success){
            updatePost.find('.imgp img').attr('src', jsonObj.post.postThumbnailURL);
            updatePost.find('.title').html(jsonObj.post.postTitle);            
            updatePost.find('.description p').html(jsonObj.post.postDescription);
            
            //hide loading and show form
            $('#edit-modal .loading-placeholder').html('').hide();
            $('#edit-modal .form-container').show();
        }
    });
}