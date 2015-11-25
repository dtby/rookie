class TestsController < ApplicationController

	# 出事测试为第一个能力的初级
	def new
		# 参数 (能力，等级)
		@questions = Question.select_questions(1, 1)
		@question = @questions[0]
	end

	# 下一个等级
	def next_level
		
	end

	# 下一个能力
	def next_power
		
	end
end
