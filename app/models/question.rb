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
#  answer     :integer
#

class Question < ActiveRecord::Base
	validates :problem, :level, :power, :genre, presence: true

	has_one :option, dependent: :destroy

	# 试题所属等级
	enum level: { low: 1, middle: 2, high: 3 }
	LEVEL = { low: '初级', middle: '中级', high: '高级' }

	# 试题所属能力
	enum power: { surface: 1, communicate: 2, decision: 3, cooperate: 4, control: 5 }
	POWER = { surface: '形象力', communicate: '沟通力', decision: '决策力', cooperate: '协作力', control: '控制力' }

	# 试题所属类型
	enum genre: { social: 1, work: 2, home: 3, knowledge: 4 }
	GENRE = { social: '社交', work: '职场', home: '居家', knowledge: '知识' }

	scope :level, ->(l) { where(level: l) }
	scope :power, ->(p) { where(power: p) }
	scope :genre, ->(g) { where(genre: g) }

	# 选择测试题
	# 参数：(能力) p in [1,2,3,4,5], (等级) l in [1,2,3]
	def self.select_questions(p, l)
		cache = []
		# 根据能力判断使用哪种题型数 【暂定未1题】
		if p == 1 || p == 2
			genre = { social: 1, work: 1, home: 1, knowledge: 1 }
		elsif p == 3
			genre = { social: 1, work: 1, home: 1, knowledge: 1 }
		else
			genre = { social: 1, work: 1, home: 1, knowledge: 1 }
		end
		# 按照题型和题型数选出试题，并存入cache
		genre.each do |key, value|
			cache.push(Question.power(p).level(l).send(key).shuffle[0, value])
		end
		return cache.flatten
	end

	# 对比答案计算用户成绩
	def self.score(power, level, user_answers)
		score = 0

		# 生成标准答案
		standard_answers = []
		questions = Question.select_questions(power, level)
		questions.each do |question|
			standard_answers.push question.answer
		end

		# 计算用户成绩
		user_answers.each_with_index do |ua, index|
			score += 1 if ua.to_i == standard_answers[index]
		end

		# 计算段位
		case score
		when 1
			[(level - 1) * 3 + 1, 0]
		when 2
			[(level - 1) * 3 + 2, 0]
		when 3
			[(level - 1) * 3 + 3, 0]
		when 4
			[(level - 1) * 3 + 3, 1]
		end
	end
end
