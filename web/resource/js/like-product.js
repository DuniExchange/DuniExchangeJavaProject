var $likebtn = $('.like-button');

$likebtn.on('click.like.button', function(){
    console.log('like');
    $(this).toggleClass('liked');
    $(this).find(".like-icon i").toggleClass('far fa-heart fas fa-heart');
});

$likebtn.on('click.ajax.send.button', sendLikeRequest);

function sendLikeRequest(){
    let $this = $(this);
    
    $this.off('click.ajax.send.button', sendLikeRequest);       
    sendData('like-post', {action: "dolike", postID: $this.closest('.post').data('id')}).done(function(response){
        console.log("response: " + response);
        $this.on('click.ajax.send.button', sendLikeRequest);
        updateLike($this.parent().find('.post-like'));
    });
}

function updateLike(target){
    sendData('like-post', {action: "getlike", postID: target.closest('.post').data('id')}).done(function(response){
        target.html(response);
    });
}



