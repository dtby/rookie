# == Schema Information
#
# Table name: works
#
#  id         :integer          not null, primary key
#  company    :string(255)
#  start_time :date
#  end_time   :date
#  position   :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Work < ActiveRecord::Base
  belongs_to :user
end
