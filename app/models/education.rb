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

class Education < ActiveRecord::Base
  belongs_to :user
  enum stage: { dazhuan: 1, benke: 2, shuoshi: 3, boshi: 4 }
  STAGE = { dazhuan:'大专', benke:'本科', shuoshi:'硕士', boshi:'博士'}
end
