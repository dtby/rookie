# == Schema Information
#
# Table name: searches
#
#  id         :integer          not null, primary key
#  options    :integer
#  other      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Search < ActiveRecord::Base
  enum options: {circle: 0, open_class: 1, friend: 2, other: 3 }
  OPTIONS = {circle: "朋友圈的转发文章", open_class: "校园公开课", friend: "好友推荐", other: "其他"}
end
