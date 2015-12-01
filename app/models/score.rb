# == Schema Information
#
# Table name: scores
#
#  id          :integer          not null, primary key
#  surface     :integer          default(0)
#  communicate :integer          default(0)
#  decision    :integer          default(0)
#  cooperate   :integer          default(0)
#  control     :integer          default(0)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Score < ActiveRecord::Base
  belongs_to :user
end
