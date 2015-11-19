class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :task, dependent: :destroy

  attr_accessor :login
  attr_accessor :message #短信验证码

  validates :mobile, presence: true, uniqueness: true, on: :create
  validate :mobile_reg?, on: :create
  #validates :nickname, presence: true, length: {minimum: 3, maximum: 50}
  validates :message, presence: true, on: :create
  validate :is_right_message?, if: "message.present?", on: :create
  validates :name, presence: true, on: :update

  def mobile_reg?
    reg = /^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/
    if not mobile.match reg
      errors.add(:mobile, :mobile_reg)
    end
  end

  def is_right_message?
    if ! Message.is_right_message? mobile, message
      errors.add(:message, :message_error)
    end
  end

  # 使用手机号登录
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["phone = :value", { :value => login.strip }]).first
  end

  #判断是否需要更新密码
  # def update_judge(params)
  #   if params[:password].present? || params[:password_confirmation].present?
  #     update(params)
  #   else
  #     update_without_password(params)
  #   end
  # end

  # 不验证邮箱
  def email_required?
    false
  end
end
