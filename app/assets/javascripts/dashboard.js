(function(){

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

  $(window).load(function(){
    console.log(window.location.pathname);
  });

}());
