class Admin::OptionsController < Admin::BaseController
	before_action :set_question
	before_action :set_option, only: [:edit, :update, :destroy]

	respond_to :html, :js

	def index
		@options = @question.options.order(:tab)
	end

	def new
		@option = @question.options.new
		respond_with @option
	end

	def create
		@option = @question.options.build(option_params)
		respond_to do |format|
			if @option.save
				format.js { render js: "location.href='#{admin_question_options_path(@question, kind: @question.kind)}'" }
			else
				format.js
			end
		end
	end

	def edit
		respond_with @option
	end

	def update
		respond_to do |format|
			if @option.update(option_params)
				format.js { render js: "location.href='#{admin_question_options_path(@question, kind: @question.kind)}'" }
			else
				format.js
			end
		end
	end

	def destroy
		@option.destroy
		redirect_to admin_question_options_path(@question, kind: @question.kind)
	end

	private
	def set_question
		@question = Question.find(params[:question_id])
	end

	def set_option
		@option = Option.find(params[:id])
	end

	def option_params
		params.require(:option).permit(:tab, :content)
	end
end