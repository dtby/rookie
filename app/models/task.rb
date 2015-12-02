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
#  state          :integer
#  deadline       :datetime
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
#

class Task < ActiveRecord::Base
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :skills, :interests

  belongs_to :user
  belongs_to :task_type
  has_many :apply, dependent: :destroy

  enum grade: { 'A': '1', 'B': '2', 'C': '3', 'D': '4' }
  enum place: { '上海': '1', '安徽': '2', '珠海': '3', '北京': '4' }

  enum degree: {
    master: '1',
    university: '2',
    vocation: '3',
    other: '4'
  }
  DEGREE = { master: '研究生', university: '本科', vocation: '高职', other: '其他' }
end
