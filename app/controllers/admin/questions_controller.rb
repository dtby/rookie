class Admin::QuestionsController < Admin::BaseController
	respond_to :html, :js
	# 后台测试题
	def index
		@questions = Question.kind(params[:kind]).order(id: :desc).page params[:page]
		@question = Question.new
	end

	# 手动添加试题
	def new
		@question = Question.new
		respond_with @question
	end

	# 创建试题
	def create
		@kind = question_params[:kind]
		if @kind == 'image'
			images = params[:question].slice(:imagea, :imageb, :imagec, :imaged)
			@question = Question.save_question_with_images(question_params, images)
		else
			question = Question.new(question_params)
			@question = question.save
		end
		respond_with @question
	end

	def edit
		@question = Question.find(params[:id])
		respond_with @question
	end

	def update
		images = params[:question].slice(:imagea, :imageb, :imagec, :imaged)
		question = Question.find(params[:id])
		@kind = question.kind
		if @kind == 'image'
			@success = question.update_question_with_images(question_params, images)
		else
			@success = question.update(question_params)
		end
		respond_with @success
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
		respond_with @question
	end

	def clear
		Question.kind(params[:kind]).destroy_all
		redirect_to admin_questions_path(kind: params[:kind])
	end

	private
	def question_params
		params.require(:question).permit(:problem, :power, :level, :genre, :answer, :kind)
	end
end