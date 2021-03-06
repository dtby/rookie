class AttentionController < BaseController
  before_action :set_user
  def focus
    @focus = @user.votes.up.for_type(User).votables
  end

  def subscription
    @subscriptions = @user.subscriptions.order(created_at: :desc)
  end

  def interest
    @interests = @user.votes.up.for_type(Task).votables
  end

  private

  def set_user
    @user = current_user
  end
end
