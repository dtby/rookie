class Admin::UsersController < Admin::BaseController
	respond_to :html, :js
	before_action :set_user, only: [:edit, :update, :destroy]

	def index
		@users = User.send(params[:role]).page(params[:page])
	end

	def edit
		respond_with :js
	end

	def update
		if @user.update(user_params)
			@success = true
		end
		respond_with @user
	end

	def destroy
		@user.destroy
		redirect_to admin_users_path(role: params[:role], page: params[:page])
	end

	private
	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:role)
	end
end