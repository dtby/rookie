class TestsController < ApplicationController
	respond_to :html, :js

	# 进入测试为用户的等级与能力级别
	def new
		# 取出测试题，参数 (能力，等级)
		@questions = Question.select_questions(session[:power], session[:level])
	end

	# 提交单次成绩
	def create
		@score = Question.score(session[:power], session[:level], params[:answers])
		if @score = 4
		
		else
			respond_with @score
		end
	end

	# 保存退出
	def update
		
	end

	# 下一个等级
	def next_level

	end

	# 下一个能力
	def next_power
		
	end

	# 最终成绩
	def result

	end
end
