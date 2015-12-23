class SignsController < ApplicationController
  respond_to :js, :json

  def create
    @user_id = current_user.id
    @sign = Sign.new(user_id: @user_id)
    
    if @sign.save
      current_user.grow_logs.create!(content: "每日签到", grow_type: 5)
      @coin = current_user.points(category: 'coin')
      @experience = current_user.points(category: 'experience')
      @success = true
    else
      @success = false
    end
    respond_with :js
  end
end
