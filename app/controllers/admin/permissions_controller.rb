class Admin::PermissionsController < Admin::BaseController
	respond_to :html, :js

	before_action :set_permission, only: [:destroy, :edit, :update]

	def index
		@permissions = Permission.send(params[:role]).page(params[:page])
	end

	def edit
		respond_with @permission
	end

	def update
		if @permission.update(permission_params)
			@success = true
		else
			@success = false
		end
		respond_with @permission
	end

	def destroy
		@permission.destroy
		redirect_to admin_permission_path(role: params[:role], page: params[:page])
	end

	private
	def set_permission
		@permission = Permission.find(params[:id])
	end

	def permission_params
		params.require(:permission).permit(:release, :receive_per_month, :meanwhile, :money)
	end
end