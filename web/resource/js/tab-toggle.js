function showContent(keyword, id) {
    tabcontensId ='#' + keyword + '-tabcontents';
    if(id === null) return;
    let index = 0;
    let totalTab = $('.tabcontents .tabcontent').length;
    $(keyword + ' .tabcontent').each(function(){        
        if(this.id === id) index = $(this).index();
    });
    var scale = (index/totalTab*100);
    console.log(`translateX(${scale}%)`);
    $('#tabcontents').css("transform", `translateX(-${scale}%)`);
}

function addTabToggleEvent(keyword){
    let tablinksId ='#' + keyword + '-tablinks';
    $(tablinksId + ' .tablink').on('changetab', function(event, eventKeyword){    
            var id = this.id.split("-")[1];
            $('.tablink').each(function(){
                console.log('remove!');
                $(this).removeClass('active');
            });
            this.className += ' active';
            showContent(eventKeyword, id);
    });
    $(tablinksId + ' .tablink').on('click', function(){
       $(this).trigger('changetab', [keyword]);
    });
}


