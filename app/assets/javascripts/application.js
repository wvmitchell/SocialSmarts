// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// $(function changeColor() {
//   $(".klout").click(function(e){
//     $("div.klout").addClass('green');
//     e.prevent_default();
//   });
// })


$(function(){
  $(".respond_link").on("click", function(e){

    var smartbox = $(this).parents(".smartbox");
    var reply_dropdown = smartbox.next(".reply_dropdown");

    reply_dropdown.slideToggle('slow');

    e.preventDefault();
  })
})

$(function(){
  $(".archive_link").on("click", function(){
    $(this).parents(".smartbox").slideToggle(1000);
    $.ajax({
      type: "POST",
      url: $(this).attr('href')
    });
    return false;
  });
});

$(function(){
  $(".flag_link").on("click", function(){
    $(this).parents(".smartbox").slideToggle(1000);
    $.ajax({
      type: "POST",
      url: $(this).attr('href')
    });
    return false
  });
});
