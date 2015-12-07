# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  number                 :integer
#  nickname               :string(255)
#  name                   :string(255)
#  nation                 :string(255)
#  gender                 :integer
#  phone                  :string(255)
#  native                 :string(255)
#  present                :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :task, dependent: :destroy
  has_many :apply, dependent: :destroy
  has_many :scores, dependent: :destroy
  has_one :score_cache, dependent: :destroy

  validates :phone, presence: true, uniqueness: true, on: :create
  validate :phone_reg?, on: :create
  validates :message, presence: true, on: :create
  validate :is_right_sms?, if: "message.present?", on: :create

  # attr_accessor :login
  attr_accessor :message #短信验证码

  
  # 使用手机号登录
  # def self.find_for_database_authentication(warden_conditions)
  #   conditions = warden_conditions.dup
  #   login = conditions.delete(:login)
  #   where(conditions).where(["phone = :value", { :value => login.strip }]).first
  # end

  def phone_reg?
    reg = /^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/
    if not phone.match reg
      errors.add(:phone, :phone_reg)
    end
  end

  def is_right_sms?
    if ! Message.is_right_sms? phone, message
      errors.add(:message, :sms_error)
    end
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

  # 测试：保存退出
  def save_score(power, level, score, upgrade)
    # {1=>:surface, 2=>:communicate, 3=>:decision, 4=>:cooperate, 5=>:control}
    power_hash = Question.powers.invert.map { |key, value| [key, value.to_sym] }.to_h
    user_score = (level - 1) * 3 + score.to_i
    result = ''

    User.transaction do
      self.scores.last.update_columns(power_hash[power] => user_score)
      # 达到升级条件后，根据当前能力和等级更新成绩
      if upgrade.to_i == 1
        if level == 3
          # TODO power = 能力数
          if power == 2
            self.score_cache.update!(power: power + 1, level: level)
            result = 'test_end'
          else
            self.score_cache.update!(power: power + 1, level: 1)
            result = 'power_up'
          end
        else
          self.score_cache.update!(power: power, level: level + 1)
          result = 'level_up'
        end
      else
        # TODO power = 能力数
        if power == 2
          self.score_cache.update!(power: power + 1, level: level)
          result = 'test_end'
        else
          self.score_cache.update!(power: power + 1, level: 1)
          result = 'power_up'
        end
      end
    end

    return result
  end

  # 用户的五大能力得分
  def power_scores
    cache = []
    Question::powers.keys.each do |power|
      cache.push self.scores.last.send(power)
    end
    return cache
  end
end
