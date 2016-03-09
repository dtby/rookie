# == Schema Information
#
# Table name: tasks
#
#  id             :integer          not null, primary key
#  figure         :integer
#  communicate    :integer
#  coordination   :integer
#  control        :integer
#  decision       :integer
#  p_figure       :integer
#  p_communicate  :integer
#  p_coordination :integer
#  p_control      :integer
#  p_decision     :integer
#  grade          :integer
#  name           :string(255)
#  state          :integer          default(3)
#  range          :integer
#  coin           :integer
#  describe       :text(65535)
#  goal           :text(65535)
#  extra          :text(65535)
#  place          :string(255)
#  user_id        :integer
#  task_type_id   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  tab            :string(255)
#  deadline       :string(255)
#  p              :string(255)
#  c              :string(255)
#  a              :string(255)
#  member_count   :integer
#  task_type      :string(255)
#

class Task < ActiveRecord::Base
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :skills, :interests
  
  #收藏功能
  acts_as_votable


  belongs_to :user, counter_cache: true
  # belongs_to :task_type
  has_many :applies, dependent: :destroy

  validates :user_id, :name, :deadline, :grade, :p, :c, :member_count, :task_type, 
            :figure, :p_figure, :communicate, :p_communicate, :control, :p_control, 
            :coordination, :p_coordination, :decision, :p_decision, :describe, :goal, presence: true

  enum grade: { 
    a: 1, 
    b: 2, 
    c: 3, 
    d: 4
  }
  GRADE = {a: 'A级', b: 'B级', c: 'C级', d: 'D级' }

  enum state: {failed: 0, complete: 1, underway: 2, wait: 3}
  STATE = {failed: '已失效', complete: '已完成', underway: '进行中', wait: '召集中'}


  POWER = { surface: :p_figure, communicate: :p_communicate, decision: :p_decision, cooperate: :p_coordination, control: :p_control }

  # 取得任务的要求能力
  def require
    cache = []
    Question::POWER.keys.each do |power|
      cache.push self.send(Task::POWER[power])
    end
    return cache
  end

  # 匹配度计算
  def suit_degree user
    sum = 0
    task_powers = [figure, communicate, decision, coordination, control]
    user_powers = user.scores.last.slice(:surface, :communicate, :decision, :cooperate, :control).values
    user_powers.each_with_index do |power, index|
      if power == 0 || task_powers[index].nil?
        sum = 0
      else
        task_powers.empty? ? sum = 0 : sum += ((power.to_f / task_powers[index]) * 100 / 5)
      end
    end
    return sum.round(0)
  end

  # 归档任务
  def complete_task
    begin
      Task.transaction do
        self.update!(state: 1)
        self.applies.each do |apply|
          if apply.deal?
            apply.update!(state: 0)
          else
            apply.update!(state: 3)
          end
        end
      end
    rescue Exception => e
      puts "===================complete_task======================="
      puts e.message
      puts "===================complete_task======================="
      ActiveRecord::Rollback
    end
    # 判断是否成功
    return e.present? ? false : true
  end
end
