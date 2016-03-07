# == Schema Information
#
# Table name: educations
#
#  id         :integer          not null, primary key
#  stage      :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  time       :string(255)
#  name       :string(255)
#

require 'test_helper'

class EducationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
