class Admin::QuestionsController < Admin::BaseController
	respond_to :html, :js
	# 后台测试题
	def index
		@questions = Question.kind(params[:kind]).page params[:page]
	end

	# 手动添加试题
	def new
		@question = Question.new
		respond_with @question
	end

	def create

	end

	# 从Excel表导入
	def import
		respond_to :js
	end

	# 写入数据库
	def import_create
		Question.import(params[:attachment])
		redirect_to admin_questions_path(kind: 'word')
	end

	def destroy
		@question = Question.find(params[:id])
		@question.destroy
		redirect_to admin_questions_path(kind: params[:kind], page: params[:page])
	end
end