# == Schema Information
#
# Table name: educations
#
#  id         :integer          not null, primary key
#  stage      :integer
#  time       :date
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Education < ActiveRecord::Base
  belongs_to :user
end
