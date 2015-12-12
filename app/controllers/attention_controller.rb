class AttentionController < BaseController
  before_action :set_user
  def focus
    @focus = @user.votes.up.for_type(User).votables
  end

  def subscription
    
  end

  def feedback
    
  end

  def interest
    @interests = @user.votes.up.for_type(Task).votables
  end

  private

  def set_user
    @user = current_user
  end
end
