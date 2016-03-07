# == Schema Information
#
# Table name: task_types
#
#  id         :integer          not null, primary key
#  type       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TaskType < ActiveRecord::Base
  # has_many :task, dependent: :destroy
end
