class SearchsController < ApplicationController
  before_action :set_user
  respond_to :js, :json
  def new
    @search = Search.new
  end
  def create
    @search = Search.new(search_params)
    pp search_params
    if @search.save
      flash.now[:notice] = "创建成功"
      respond_with personal_user_path(@user)
    else
      render :new
    end
  end

  private

  def search_params
    params.require(:search).permit(:options, :other)
  end
  def set_user
    @user =  current_user
  end
end
