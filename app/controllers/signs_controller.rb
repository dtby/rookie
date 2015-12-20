class SignsController < ApplicationController
  respond_to :js, :json

  def create
    @sign = Sign.new(user_id: params[:user_id])
    
    if @sign.save
      current_user.grow_logs.create!(content: "每日签到", grow_type: 5)
      pp "每日签到============="
      
      @coin = current_user.points(category: 'coin')
      @experience = current_user.points(category: 'experience')
      @user_id = params[:id]
    else
      @user_id = nil
    end
    respond_with @sign
  end
end
