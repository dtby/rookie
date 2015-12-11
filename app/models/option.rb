# == Schema Information
#
# Table name: options
#
#  id          :integer          not null, primary key
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tab         :integer
#  content     :string(255)
#

class Option < ActiveRecord::Base
	validates :question_id, :tab, presence: true
	
  belongs_to :question
  has_one :image, as: :imageable, dependent: :destroy
end
