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
#  kind       :integer
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

	# 试题版式
	enum kind: { word: 0, image: 1 }
	TYPE = { word: '文字题', image: '图片题' }

	scope :level, ->(l) { where(level: l) }
	scope :power, ->(p) { where(power: p) }
	scope :genre, ->(g) { where(genre: g) }
	scope :kind, ->(t) { where(kind: self.kinds[t]) }

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
			[1, 0]
		when 2
			[2, 0]
		when 3
			[3, 0]
		when 4
			[3, 1]
		end
	end

	# 从excel导入试题
	def self.import(file)
		spreadsheet = Question.open_spreadsheet(file)
    header = [:problem, :power, :level, :genre, :answer]
    answer = {"A" => 1, "B" => 2, "C" => 3, "D" => 4, "E" => 5, "F" => 6}
    options_index = [:a, :b, :c, :d, :e, :f]
    begin
      Question.transaction do
        #self.destroy_all # 删除原来的题
        spreadsheet.each_with_index  do |row, index|
          next if index == 0
          # 题目创建
          question = Question.new
          values = row.slice(0..(header.size - 1))
          values[1] = Question.powers[Question::POWER.invert[values[1].split(" ").join("")]]
          values[2] = Question.levels[Question::LEVEL.invert[values[2].split(" ").join("")]]
          values[3] = Question.genres[Question::GENRE.invert[values[3].split(" ").join("")]]
          values[4] = answer[values[4].split(" ").join("")]
          attrs = Hash[[header, values].transpose]
          attrs[:kind] = 0
          question.attributes = attrs
          question.save!

          # 保存选项
          options = Hash[[options_index, row.slice(header.size..row.size)].transpose]
          options[:question_id] = question.id
          Option.create!(options)
        end
      end
    rescue Exception => e
      puts "===================import======================="
      puts e.message
      puts "===================import======================="
      ActiveRecord::Rollback
    end
	end

	# 判断格式
	def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path)
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "未知格式: #{file.original_filename}"
    end
  end

end
