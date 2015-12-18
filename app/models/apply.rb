# == Schema Information
#
# Table name: applies
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  task_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  state      :integer
#

class Apply < ActiveRecord::Base
  belongs_to :user
  belongs_to :task

  enum state: { fail: 0, success: 1, deal: 2 }
  STATE = { deal: "正在处理", success: "接包成功", fail: "接包失败" }

  scope :members, -> { where(state: true) }

  # 处理任务申请
  def deal_apply task_id
  	task = Task.find(task_id)
  	required_count = task.member_count
  	now_count = task.applies.success.count

  	if now_count < required_count
  		self.update_columns(state: 1)
  		return true
  	else
  		self.update_columns(state: 0)
  		return false
  	end
  end
end
