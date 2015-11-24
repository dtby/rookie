# == Schema Information
#
# Table name: information
#
#  id              :integer          not null, primary key
#  birth_account   :string(255)
#  qq              :string(255)
#  email           :string(255)
#  id_number       :string(255)
#  education       :integer
#  graduate        :string(255)
#  graduation_time :date
#  political       :integer
#  hobbies         :string(255)
#  specialty       :string(255)
#  language        :string(255)
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class InformationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
