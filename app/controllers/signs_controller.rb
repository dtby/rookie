class SignsController < ApplicationController
  respond_to :js, :json

  def create
    @user_id = current_user.id
    @sign = Sign.new(user_id: @user_id)
    
    if @sign.save
      current_user.grow_logs.create!(content: "每日签到", grow_type: 5)
      if User.roles[current_user.try(:role)] <= 3
        @coin = current_user.points(category: 'coin')+5
        @experience = current_user.points(category: 'experience')+1
      else
        @coin = current_user.points(category: 'coin')+20
        @experience = current_user.points(category: 'experience')+1
      end
      # score_points.where("created_at > '#{1.month.ago}'").sum(:num_points)
      @user_id = params[:user_id]
      @user = current_user
      @success = true
    else
      @success = false
    end
    respond_with :js
  end
end
