# == Schema Information
#
# Table name: applies
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  task_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  state      :integer          default(2)
#

class Apply < ActiveRecord::Base
  belongs_to :user
  belongs_to :task, counter_cache: true

  enum state: { fail: 0, success: 1, deal: 2, complete: 3 }
  STATE = { fail: "接包失败", success: "接包成功", deal: "正在处理", complete: '任务结束' }

  scope :members, -> { where(state: true) }

  # 处理任务申请
  def deal_apply task_id
  	task = Task.find(task_id)
  	required_count = task.member_count
  	now_count = task.applies.success.count

  	if now_count < required_count
      begin
    		Apply.transaction do 
          self.update!(state: 1)
          task.update!(state: 2)
          self.user.grow_logs.create!(content: "接包成功：#{self.task.name}", grow_type: 3)
          puts "接包成功============"
        end
      rescue Exception => e
        puts "===================deal_apply======================="
        puts e.message
        puts "===================deal_apply======================="
        ActiveRecord::Rollback
      end
  		return true
  	else
  		self.update_columns(state: 0)
  		return false
  	end
  end
end
