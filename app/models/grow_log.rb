# == Schema Information
#
# Table name: grow_logs
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  grow_type  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GrowLog < ActiveRecord::Base
  belongs_to :user
end
