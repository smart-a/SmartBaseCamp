
$(function(){
    //alert("Thread");
    $('.reply-btn').on('click',function(){  //$(document).on('click','.reply-btn',function(){
        $(this).parent('.pull-right').siblings('.reply-container').toggleClass('hide');
    });
});