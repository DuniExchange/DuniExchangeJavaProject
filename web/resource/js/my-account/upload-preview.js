var $input = $('.preview-img-input');
var $preview = $('.upload-preview');

console.log($preview);

function previewFile(eventTarget, files){
    let previewTarget = $(eventTarget).closest('.img-container').find('.preview');
    console.log('preview target: ', previewTarget);
    console.log('files: ', files);
    let fileNames = "";
    let n = 0;

    if(files.length > 0){
        console.log($(previewTarget).closest('.img-container').find('.error-font'));//remove error
        for(const file of files){
            let type = file.type.split("/").pop();
            if(type !== 'jpg' && type !== 'jpeg' && type !== 'png' && type !== 'bmp'){
                insertError($(previewTarget).closest('.img-container')[0], "Please choose valid img file extension (.jpg, .jpeg, .png, .bmp)");
                return;
            }
        }
        $('.upload-preview').addClass('move-out');
        $('.upload-icon').addClass('d-none');
    } else {
        clearPreview();
        return;
    }

    previewTarget.html('');
    for(const file of files){
        n++;
        fileNames += '"' +  file.name + '"' + ', ';
        previewTarget.append('<img src="/DuniExchange/resource/img/bubble-loading.gif" class="img-preview me-2"></img>');
        let output = previewTarget.children('img:last-child');
        output.attr('src', URL.createObjectURL(file));
    }
    fileNames = fileNames.substring(0, fileNames.length-2);
    output.onload = function() {
       URL.revokeObjectURL(output.src); // free memory
    };
}

function clearPreview(){
    $('.upload-preview').removeClass('move-out');
    $('.preview').html('');
    $('.upload-preview').addClass('move-in');
    setTimeout(function(){
        $('.upload-preview').removeClass('move-in');
    }, 600);
    $('.upload-icon').removeClass('d-none');
}

function handleChooseFile(event) {
    console.log('call');
    if(event === null) return;
    console.log('event target: ', $(event.target));
    var files = event.target.files;
    previewFile(event.target, files);
}

$input.change(function(event){handleChooseFile(event);});

$preview.on('drag dragstart dragend dragover dragenter dragleave drop', function(e) {
    e.preventDefault();
    e.stopPropagation();
})
.on('dragover dragenter', function(e) {
    $(this).addClass('move-out');
})
.on('dragleave dragend drop', function(e) {             
    $(this).removeClass('move-out');
    $(this).addClass('move-in');
    setTimeout(function(e){
        $(this).removeClass('move-in');
    }, 600);
})
.on('drop', function(e) {
    droppedFiles = e.originalEvent.dataTransfer.files;
    $(this).parent().find('.preview-img-input')[0].files = droppedFiles;        
    previewFile($(this),droppedFiles);
});

