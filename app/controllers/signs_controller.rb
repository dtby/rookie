class SignsController < ApplicationController
  respond_to :js, :json

  def create
    @sign = Sign.create(user_id: params[:user_id])
    
    if @sign.save
      @success = true
    else
      @success = false
    end
    respond_with @sign,@success
  end

end
