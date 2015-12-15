$ ->
  #实现任务包收藏、订阅
  $(".vote-create-a").unbind("click")
  $(".vote-create-a").click ->
    $.ajax vote_create_path,
      type: 'POST'
      data: { 
        voteable_id: $(this).attr("voteable_id"), 
        voteable_type: $(this).attr("voteable_type"),
        style_type: $(this).attr("style_type"),
        scope: $(this).attr("scope")
      }