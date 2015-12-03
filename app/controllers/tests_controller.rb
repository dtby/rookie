class TestsController < BaseController
	respond_to :html, :js

	before_action :import_session, only: [:new, :create, :update, :next]

	# 进入测试为用户的等级与能力级别
	def new
		# 取出测试题，参数 (能力，等级)
		if @power <= 2
			@questions = Question.select_questions(@power, @level)
		else
			redirect_to result_tests_path(status: 'end')
		end 
	end

	# 提交单次成绩
	def create
		@score = Question.score(@power, @level, params[:answers])
		respond_with @score
	end

	# 保存退出
	def update
		current_user.save_score(@power, @level, params[:score], params[:upgrade])
		redirect_to user_path(current_user)
	end

	# 继续答题
	def next
		result = current_user.save_score(@power, @level, params[:score], params[:upgrade])
		if result == 'test_end'
			redirect_to result_tests_path(status: 'end')
		elsif result == 'level_up'
			session[:level] += 1
			redirect_to action: 'new'
		else
			session[:power] += 1
			session[:level] = 1
			redirect_to action: 'new'
		end
	end

	# 测试成绩
	def result

	end

	private
		# 取出power 和 level
		def import_session
			@power = session[:power]
			@level = session[:level]
		end
end
