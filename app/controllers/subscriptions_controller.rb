class SubscriptionsController < ApplicationController
  before_action :set_user
  def index
    @subscriptions = Subscription.order(created_at: :desc)
  end

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(subscription_params)
    if @subscription.save
      flash.now[:notice] = "创建成功"
      redirect_to subscription_user_attention_index_path(@user)
    else
      render :new
    end
  end

  def edit
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
    @user = current_user
  end
end