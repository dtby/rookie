# == Schema Information
#
# Table name: applies
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  task_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  state      :boolean
#

class Apply < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
end
