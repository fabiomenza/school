$ ->

  $("#flash_notice, #flash_error").fadeOut(10000);

  $("#flash_notice, #flash_error").on("click", (event)->
    $(event.target).hide()
  )

  
