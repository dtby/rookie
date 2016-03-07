# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  number                 :integer
#  nickname               :string(255)
#  name                   :string(255)
#  nation                 :string(255)
#  gender                 :integer
#  phone                  :string(255)
#  native                 :string(255)
#  present                :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)      default("")
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  birth                  :string(255)
#  sash_id                :integer
#  level                  :integer          default(0)
#  role                   :integer          default(1)
#  permission_id          :integer
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
