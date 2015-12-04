class MessagesController < ApplicationController
  respond_to :js, :json

  def create
    @message = Message.find_or_initialize_by message_params
    #保存验证码到数据库
    @success = @message.send_message
    respond_with @message,@success
  end

  private 
    def message_params
      params.require(:message).permit(:phone)
    end
end
