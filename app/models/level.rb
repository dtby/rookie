# == Schema Information
#
# Table name: levels
#
#  id             :integer          not null, primary key
#  figure         :integer
#  communicate    :integer
#  coordination   :integer
#  control        :integer
#  decision       :integer
#  p_figure       :integer
#  p_communicate  :integer
#  p_coordination :integer
#  p_control      :integer
#  p_decision     :integer
#  theoretical    :integer
#  practical      :integer
#  grade          :integer
#  title          :integer
#  qualification  :integer
#  identity       :integer
#  deadline       :datetime
#  put_time       :integer
#  get_time       :integer
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Level < ActiveRecord::Base
  belongs_to :user
end
