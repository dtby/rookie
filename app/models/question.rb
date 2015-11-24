# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  problem    :text(65535)
#  level      :integer
#  power      :integer
#  genre      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ActiveRecord::Base
	validates :problem, :level, :power, :genre, presence: true
	validates :level, :power, :genre, numericality: { only_integer: true }

	# 试题所属等级
	enum level: { low: 1, middle: 2, high: 3 }
	LEVEL = { low: '初级', middle: '中级', high: '高级' }

	# 试题所属能力
	enum power: { surface: 1, control: 2, communication: 3, cooperate: 4, decision: 5 }
	POWER = { surface: '形象力', control: '控制力', communication: '沟通力', cooperate: '协作力', decision: '决策力' }

	# 试题所属类型
	enum genre = { social: 1, work: 2, home: 3, knowledge: 4 }
	GENRE = { social: '社交', work: '职场', home: '居家', knowledge: '知识' }
end
