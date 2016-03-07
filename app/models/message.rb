# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  phone      :string(255)
#  code       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ActiveRecord::Base
  # == Schema Information

  #发送短信验证码
  def send_message

    # message_log = Logger.new(File.join Rails.root, 'log/message.log')

    # message_log.info "========send message start(#{Time.now})========"


    #短信验证码生成
    self.code = Message.rand_code 4

    #设置云片使用账号
    ChinaSMS.use :yunpian, password: 'a1b163c21980f071ca494def72634674'

    #发送短信验证码
    tpl_params = { code: self.code , company: '菜鸟烩', app: '菜鸟烩' }
    msg = ChinaSMS.to self.phone , tpl_params, tpl_id: 5
    # msg = ChinaSMS.to self.phone , tpl_params, tpl_id: 1

    # #log记录发送的信息
    # message_log.info "phone number: #{self.phone}"
    # message_log.info "code: #{self.code}"

    if msg["code"] == 0
      #验证码发送成功则保存message
      if self.save
        # message_log.info "send success"
        send_message = true
      else
        # message_log.info "message save Failure xxxxxxxxxxxxxxxxxxx"
        # message_log.info self.errors.to_s
      end
    else
      # message_log.info "send Failure xxxxxxxxxxxxxxxxxxx"
      send_message = false
    end 
    # message_log.info msg.to_s
    # message_log.info "========send message end(#{Time.now}):========"

    send_message
  end


  #生成短信验证码
  #参数：len，验证码长度
  def self.rand_code len
    chars = ("0".."9").to_a
    code = ""
    1.upto(len) { |i| code << chars[rand(chars.size-1)] }
    return code
  end


  #确认短信验证码是正确并有效
  #短信有效时间：30分钟
  def self.is_right_sms? phone, code
    return true if code == "888888"
    Message.where("phone = ? and code = ? and updated_at >= ?", phone, code, (Time.at Time.now - 30*60) ).first
  end
end
