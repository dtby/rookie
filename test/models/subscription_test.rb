# == Schema Information
#
# Table name: subscriptions
#
#  id         :integer          not null, primary key
#  address    :string(255)
#  task_type  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
