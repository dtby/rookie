module TestsHelper
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
			'初级'
		when 2
			'中级'
		when 3
			'高级'
		end
	end
end
