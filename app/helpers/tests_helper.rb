module TestsHelper
	# 答案（用于添加试题表单）
	def answers
		{'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4, 'E' => 5, 'F' => 6 }
	end

	# 能力
	def power(power)
		case power
		when 1
			'形象力'
		when 2
			'沟通力'
		when 3
			'决策力'
		when 4
			'协作力'
		when 5
			'控制力'
		end
	end

	# 等级
	def level(level)
		case level
		when 1
			'初阶题'
		when 2
			'进阶题'
		when 3
			'高阶题'
		end
	end

	# 答案
	def answer(answer)
		case answer
		when 1
			'A'
		when 2
			'B'
		when 3
			'C'
		when 4
			'D'
		when 5
			'E'
		when 6
			'F'
		end
	end

	# 选项的值，用于单选框
	def select_option(option)
		return {a: 1, b: 2, c: 3, d: 4, e: 5, f: 6}[option]
	end
end
