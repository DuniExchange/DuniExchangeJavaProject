var totalTab = $('#tabcontents .tabcontent').length;

function showContent(id) {
    if(id === null) return;
    let index = 0;
    $('#tabcontents .tabcontent').each(function(){        
        if(this.id === id) index = $(this).index();
    });
    var scale = (index/totalTab*100);
    console.log(`translateX(${scale}%)`);
    $('#tabcontents').css("transform", `translateX(-${scale}%)`);
}

$('.tablinks').each(function(){
    console.log('add event for' + this.id);
    this.addEventListener("click", function () {
        var id = this.id.split("-")[1];
        $('.tablinks').each(function(){
            console.log('remove!');
            $(this).removeClass('active');
        });
        this.className += ' active';
        showContent(id);
    });
});

showContent('create');


