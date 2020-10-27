
$(function(){
    $('.reply-btn').on('click',function(){  //$(document).on('click','.reply-btn',function(){
        //alert('here');
        $(this).parent('.pull-right').siblings('.reply-container').toggleClass('hide');
    });
});