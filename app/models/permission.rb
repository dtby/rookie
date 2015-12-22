# == Schema Information
#
# Table name: permissions
#
#  id                :integer          not null, primary key
#  role              :integer
#  boss              :boolean
#  level             :string(255)
#  money             :boolean
#  release           :integer
#  receive_per_month :integer
#  meanwhile         :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Permission < ActiveRecord::Base
end
