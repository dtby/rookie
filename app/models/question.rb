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
	validates :problem, :level, :power, :genre, :answer, :kind, presence: true

	has_many :options, dependent: :destroy

	# 试题所属等级
	enum level: { low: 1, middle: 2, high: 3 }
	LEVEL = { low: '初阶题', middle: '进阶题', high: '高阶题' }

	# 试题所属能力
	enum power: { surface: 1, communicate: 2, decision: 3, cooperate: 4, control: 5 }
	POWER = { surface: '形象力', communicate: '沟通力', decision: '决策力', cooperate: '协作力', control: '控制力' }

	# 试题所属类型
	enum genre: { social: 1, work: 2, home: 3, knowledge: 4 }
	GENRE = { social: '社交', work: '职场', home: '居家', knowledge: '知识点' }

	# 试题版式
	enum kind: { word: 0, image: 1 }
	TYPE = { word: '文字题', image: '图片题' }

	scope :level, ->(l) { where(level: l) }
	scope :power, ->(p) { where(power: p) }
	scope :genre, ->(g) { where(genre: g) }
	scope :kind, ->(t) { where(kind: self.kinds[t]) }

	# 选择测试题
	# 参数：(能力) p in [1,2,3,4,5], (等级) l in [1,2,3]
	def self.select_questions_ids(p, l)
		cache = []
		# 根据能力判断使用哪种题型数 【暂定未1题】

		if p == 1 || p == 2
			genre = { social: 5, work: 5, home: 4, knowledge: 6 }
		elsif p == 3
			genre = { social: 4, work: 4, home: 3, knowledge: 8 }
		else
			genre = { social: 4, work: 4, home: 2, knowledge: 10 }
		end
		
		# 按照题型和题型数选出试题，并存入cache
		genre.each do |key, value|
			cache.push(Question.power(p).level(l).send(key).pluck(:id).shuffle[0, value])
		end
		return cache.flatten
	end

	# 对比答案计算用户成绩
	def self.score(questions_ids, user_answers)
		score = 0
		# 生成标准答案
		standard_answers = []
		questions_ids.each do |id|
			standard_answers.push Question.find(id.to_i).answer
		end
		# 计算用户成绩
		user_answers.each_with_index do |answer, index|
			score += 1 if answer.to_i == standard_answers[index]
		end
		# 计算段位
		if score <= 6
			[1, 0]
		elsif score <= 12 && score > 6
			[2, 0]
		elsif score <= 18 && score > 12
			[3, 0]
		elsif score > 18
			[3, 1]
		end

		# if score == 1
		# 	[1, 0]
		# elsif score == 2
		# 	[2, 0]
		# elsif score == 3
		# 	[3, 0]
		# elsif score == 4
		# 	[3, 1]
		# end
	end

	# 从excel导入试题
	def self.import(file)
		spreadsheet = Question.open_spreadsheet(file)
    header = [:problem, :power, :level, :genre, :answer]
    answer = {"A" => 1, "B" => 2, "C" => 3, "D" => 4, "E" => 5, "F" => 6}
    begin
      Question.transaction do
        #self.destroy_all # 删除原来的题
        spreadsheet.each_with_index  do |row, index|
          next if index == 0
          # 题目创建
          question = Question.new
          values = row.slice(0..(header.size - 1))
          if values.include? nil
          	next
          else
	          values[1] = Question.powers[Question::POWER.invert[values[1].split(" ").join("")]]
	          values[2] = Question.levels[Question::LEVEL.invert[values[2].split(" ").join("")]]
	          values[3] = Question.genres[Question::GENRE.invert[values[3].split(" ").join("")]]
	          values[4] = answer[values[4].split(" ").join("")]
	          attrs = Hash[[header, values].transpose]
	          attrs[:kind] = 0
	          question.attributes = attrs
	          question.save!
	        end

          # 保存选项
          row.slice(header.size..row.size).each_with_index do |option, index|
          	Option.create!(tab: index + 1, content: option, question_id: question.id) if option.present?
          end
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

  # 可选的选项标识(用于后台添加选项)
	def valid_tabs
		existed = self.options.pluck(:tab)
		tabs = {'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4, 'E' => 5, 'F' => 6 }
		cache = {}
		tabs.each do |key, value|
			cache[key] = value unless existed.include? value
		end
		return cache
	end

end
