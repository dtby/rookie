# == Schema Information
#
# Table name: internships
#
#  id          :integer          not null, primary key
#  company     :string(255)
#  position    :string(255)
#  performance :string(255)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Internship < ActiveRecord::Base
  belongs_to :user
end
