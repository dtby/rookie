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
#  email                  :string(255)      default("")
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  birth                  :string(255)
#  sash_id                :integer
#  level                  :integer          default(0)
#  role                   :integer          default(1)
#

class User < ActiveRecord::Base
  has_merit

  #关注功能
  acts_as_votable
  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :grow_logs, dependent: :destroy
  has_many :task, dependent: :destroy
  has_many :education, dependent: :destroy
  has_many :sign, dependent: :destroy
  has_many :work, dependent: :destroy
  has_many :internship, dependent: :destroy
  has_many :applies, dependent: :destroy
  has_many :scores, dependent: :destroy
  has_one :score_cache, dependent: :destroy

  validates :phone, presence: true, uniqueness: true, on: :create
  validate :phone_reg?, on: :create
  validates :message, presence: true, on: :create
  validate :is_right_sms?, if: "message.present?", on: :create

  # 回调
  after_create :add_grow_log

  #短信验证码
  attr_accessor :message

  after_create :create_score_and_score_cache

  enum role: {admin: 0, rookie: 1, rookie_gold: 2, rookie_diamond: 3, boss: 4, boss_gold: 5, boss_diamond: 6}
  ROLE = {admin: "管理员", rookie: "普通菜鸟", rookie_gold: "黄金菜鸟", rookie_diamond: "钻石菜鸟", boss: "普通BOSS", boss_gold: "黄金BOSS", boss_diamond: "钻石BOSS"}

  enum gender: {'男': 1,'女': 2}

  enum constellation: {'牡羊座♈️': 1,'金牛座♉️': 2,'双子座♊️': 3,'巨蟹座♋️': 4,'狮子座♌️': 5,'处女座♍️': 6,'天秤座♎️': 7,'天蝎座♏️': 8,'射手座♐️': 9,'摩羯座♑️': 10,'水瓶座♒️': 11,'双鱼座♓️': 12}

  enum nation: {
    '汉族': 'han','回族': 'huizu','阿昌族': 'achang','白族': 'bai','保安族': 'baoan','布朗族': 'bulang','布依族': 'buyi','朝鲜族': 'chaoxian',
    '达斡尔族': 'dahan','傣族': 'daizu','德昂族': 'deang','侗族': 'dongzu','东乡族': 'dongxiang','独龙族': 'dulong','鄂伦春族': 'elun','俄罗斯族': 'eluosi',
    '鄂温克族': 'ewen','高山族': 'gaoshan','仡佬族': 'yilao','哈尼族': 'hani','哈萨克族': 'hasake','赫哲族': 'hezhe','壮族': 'zhuangzu',
    '京族': 'jinzu','景颇族': 'jingpo','柯尔克孜族': 'keer','拉祜族': 'lagu','黎族': 'lizu','傈僳族': 'lixv','珞巴族': 'luoba','满族': 'manzu',
    '毛南族': 'maonan','门巴族': 'menba','蒙古族': 'menggu','苗族': 'miaozu','仫佬族': 'melao','纳西族': 'naxi','怒族': 'nuzu','普米族': 'pumi',
    '羌族': 'qiangzu','撒拉族': 'sala','畲族': 'chuzu','水族': 'shuizu','塔吉克族': 'tajike','塔塔尔族': 'tataer','土族': 'tuzu','土家族': 'tujia',
    '佤族': 'wazu','维吾尔族': 'weiwuer','乌兹别克族': 'wuzibieke','锡伯族': 'xibo','瑶族': 'yaozu','彝族': 'yizu','裕固族': 'yugu','藏族': 'zangzu'
  }


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
    scores = self.scores
    if scores.present?
      Question::powers.keys.each do |power|
        cache.push scores.last.send(power)
      end
    end
    return cache
  end

  def self.address(number)
    if number.present?
      p = ChinaCity.get(number.split(',').first)
      c = ChinaCity.get(number.split(',').last)
      address = p+c
    else
      address = ''
    end
  end
  
  private
    def create_score_and_score_cache
      self.create_score_cache
      self.scores.create
    end

    def email_required?
      false
    end

    def add_grow_log
      self.grow_logs.create!(content: '注册菜鸟烩会员', grow_type: 1)
    end
end
