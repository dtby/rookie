class SubscriptionsController < ApplicationController
  before_action :set_user
  respond_to :js, :json

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = @user.subscriptions.new(subscription_params)
    @subscriptions = @user.subscriptions.order(created_at: :desc)
    if @subscription.save
      flash.now[:notice] = "创建成功"
      respond_with @subscriptions
      # redirect_to subscription_user_attention_index_path(@user)
    else
      render :new
    end
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    redirect_to subscription_user_attention_index_path(@user)
  end

  private

  def subscription_params
    params.require(:subscription).permit(:address, :task_type)
  end
  def set_user
    @current_user ||= User.find_by(open_id: session[:openid])
    current_user = @current_user
    @user = current_user
  end
end