# == Schema Information
#
# Table name: works
#
#  id         :integer          not null, primary key
#  company    :string(255)
#  start_time :date
#  end_time   :date
#  position   :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class WorkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
