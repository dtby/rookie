# == Schema Information
#
# Table name: applies
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  task_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  state      :boolean
#

require 'test_helper'

class ApplyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
