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
#

class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :task_type

  enum final_education: { 'A': 1, 'B': 2, 'C': 3, 'D': 4 }
  enum final: { '上海': 1, '安徽': 2, '珠海': 3, '北京': 4 }
  enum fraction: { '1分': 1, '2分': 2, '3分': 3, '4分': 4, '5分': 5 }
end
