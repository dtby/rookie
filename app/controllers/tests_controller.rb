class TestsController < ApplicationController
	respond_to :html, :js

	before_action :import_session, only: [:new, :create]

	# 进入测试为用户的等级与能力级别
	def new
		# 取出测试题，参数 (能力，等级)
		@questions = Question.select_questions(@power, @level)
	end

	# 提交单次成绩
	def create
		@score = Question.score(@power, @level, params[:answers])
		power_hash = Question.powers.invert.map { |key, value| [key, value.to_sym] }.to_h
		pp power_hash, '11111'
		b = current_user.score.update_columns(power_hash[@level] => @score.first)
		pp b, "2222222"
		current_user.score_cache.update(power: @power, level: @level + 1) if @score.second == 1
		respond_with @score
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

	private
		def import_session
			@power = session[:power]
			@level = session[:level]
		end
end
