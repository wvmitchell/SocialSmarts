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

  setInterval(function(){
    $.ajax({
      type: "GET",
      url: "latest_mentions"
    }).success(function(data){
      var current = $(".smartbox").length
      if(data-current > 0){
        $("#tweet_notifier").fadeIn(1000);
        $("#tweet_notifier span").text(data - current);
      }
    });
  },1000);

}());
