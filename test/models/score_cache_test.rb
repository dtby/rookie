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

require 'test_helper'

class ScoreCacheTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
