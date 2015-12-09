# == Schema Information
#
# Table name: options
#
#  id          :integer          not null, primary key
#  a           :text(65535)
#  b           :text(65535)
#  c           :text(65535)
#  d           :text(65535)
#  e           :text(65535)
#  f           :text(65535)
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Option < ActiveRecord::Base
  belongs_to :question
  has_one :image, as: :imageable
end
