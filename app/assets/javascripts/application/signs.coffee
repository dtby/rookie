$ ->
  #实现签到
  $(".sign-create").click ->
    $.ajax sign_create_path,
      type: 'POST'
      data: { 
        user_id: $(this).attr("user_id")
      }