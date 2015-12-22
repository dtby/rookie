# == Schema Information
#
# Table name: permissions
#
#  id                :integer          not null, primary key
#  role              :integer
#  boss              :boolean
#  grade             :integer
#  money             :boolean
#  release           :integer
#  receive_per_month :integer
#  meanwhile         :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class PermissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
