class Admin::SearchsController < Admin::BaseController
  # 后台管理主页
  def index
    @searchs = Search.all
  end
end