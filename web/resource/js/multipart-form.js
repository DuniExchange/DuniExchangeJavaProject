var $img = $('#img');
    var $preview = $('.upload-preview');

    console.log($preview);
    
    function previewFile(files){
        var preview = document.getElementById('preview');
        var fileNames = "";
        var n = 0;
        
        if(files.length > 0){
            destroyError("img-container");
            console.log($('.preview-upload'));
            $('.upload-preview').addClass('move-out');
            $('.upload-icon').addClass('d-none');
        } else {
            $('.upload-preview').removeClass('move-out');
            $('.upload-preview').addClass('move-in');
            setTimeout(function(){
                $('.upload-preview').removeClass('move-in');
            }, 600);
            $('.upload-icon').removeClass('d-none');
            return;
        }
        
        preview.innerHTML = "";
        for(const file of files){
            n++;
            fileNames += '"' +  file.name + '"' + ', ';
            preview.innerHTML += '<img src="/DuniExchange/resource/img/bubble-loading.gif" class="img-preview me-2" id="output-'+ n +'"></img>';
            var output = document.getElementById("output-" + n);                
            output.src = URL.createObjectURL(file);
        }
        fileNames = fileNames.substring(0, fileNames.length-2);
        output.onload = function() {
           URL.revokeObjectURL(output.src); // free memory
        };
    }
    
    var handleChooseFile = function(event) {
        console.log('call');
        if(event === null) return;
        var files = event.target.files;
        previewFile(files);
    };

    $img.change(function(e){handleChooseFile(e);});

    $preview.on('drag dragstart dragend dragover dragenter dragleave drop', function(e) {
        e.preventDefault();
        e.stopPropagation();
    })
    .on('dragover dragenter', function( ) {
        $preview.addClass('move-out');
    })
    .on('dragleave dragend drop', function() {             
        $preview.removeClass('move-out');
        $preview.addClass('move-in');
        setTimeout(function(){
            $preview.removeClass('move-in');
        }, 600);
    })
    .on('drop', function(e) {
        droppedFiles = e.originalEvent.dataTransfer.files;
        previewFile(droppedFiles);
    });

