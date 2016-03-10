class TestsController < BaseController
	respond_to :html, :js

	before_action :get_last_score, only: [:new]
	before_action :import_session, only: [:new, :create, :update, :next]

	# 进入测试为用户的等级与能力级别
	def new
		# 取出测试题[question_id, ...]，参数 (能力，等级)
		@ids = Question.select_questions_ids(@power, @level)
		if @power <= 5 && @ids.present?
			@questions = []
			@ids.each do |id|
				@questions.push Question.find(id)
			end
		else
			# 已完成测试：更新用户的完成测试时间：tested_at
			current_user.update(tested_at: Time.now)

			redirect_to result_tests_path(status: 'end')
		end
	end

	# 重新测试
	def retest
		# 如果上次测试距今超过一个月，点击重新测试，重新创建成绩记录
		current_user.create_score_cache
    current_user.scores.create
    redirect_to action: 'new'
	end

	# 提交单次成绩
	def create
		powers = { 1 => '形象力', 2 => '沟通力', 3 => '决策力', 4 => '协作力', 5 => '控制力'}
		levels = { 1 => '初阶题', 2 => '进阶题', 3 => '高阶题'}
		@score = Question.score(params[:questions_ids], params[:answers])
		current_user.grow_logs.create!(content: "完成#{powers[@power]}-#{levels[@level]}测试", grow_type: 2)
		respond_with @score
	end

	# 保存退出
	def update
		current_user.save_score(@power, @level, params[:score], params[:upgrade])

		# 保存退出时，把上次测试时间置空
		current_user.update(tested_at: nil)

		redirect_to user_path(current_user)
	end

	# 继续答题
	def next
		result = current_user.save_score(@power, @level, params[:score], params[:upgrade])
		if result == 'test_end'
			# 已完成测试：更新用户的完成测试时间：tested_at
			current_user.update(tested_at: Time.now)

			redirect_to result_tests_path(status: 'end')
		elsif result == 'level_up'
			session[:level] += 1
			# 升级时，把上次测试时间置空
			current_user.update(tested_at: nil)

			redirect_to action: 'new'
		else
			session[:power] += 1
			session[:level] = 1
			# 升级时，把上次测试时间置空
			current_user.update(tested_at: nil)

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

		# 获取用户上一次的成绩并存入session
		def get_last_score
			session[:power] = current_user.score_cache.power
			session[:level] = current_user.score_cache.level
		end
end
