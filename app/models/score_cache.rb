# == Schema Information
#
# Table name: score_caches
#
#  id         :integer          not null, primary key
#  power      :integer          default(1)
#  level      :integer          default(1)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ScoreCache < ActiveRecord::Base
  belongs_to :user
end
