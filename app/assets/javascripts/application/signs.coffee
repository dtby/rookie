$ ->
  #实现签到
  $(".sign-create").unbind("click")
  $(".sign-create").click ->
    $.ajax sign_create_path,
      type: 'POST'
      data: { 
        user_id: $(this).attr("user_id")
      }