$(document).ready(function(){
    $('#nuke').on('click', function(){
        $('.bros').fadeOut(2000, function(){
            $('.bros').remove();
        });
    });
});

// get the brothers, fade them out for 2000 miliseconds
// and when it's done, this is the function i want you to use

// this is callback hell, because im only doing one thing on this page
// and ive got three functions
