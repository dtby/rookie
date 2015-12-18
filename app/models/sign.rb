# == Schema Information
#
# Table name: signs
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sign < ActiveRecord::Base
  belongs_to :user
end
