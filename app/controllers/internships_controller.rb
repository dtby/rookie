class InternshipsController < ApplicationController
  before_action :set_user
  before_action :find_internship, only: [:destroy, :create, :update, :edit]
  respond_to :js, :json
  def index
  end

  def new
    @internship = Internship.new
  end

  def create
    @internship = current_user.internships.create(internship_params)
    if @internship.save
      flash.now[:notice] = "创建成功"
      respond_with @internship
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @internship.update(internship_params)
      flash.now[:notice] = "更新成功"
      redirect_to internship_path
    else
      render :update
    end
  end

  def destroy
    @internship = Internship.find(params[:id])
    @internship.destroy
    respond_with @internship
  end

  private

  def internship_params
    params.require(:internship).permit(:company, :position, :performance)
  end
  def set_user
    @user = current_user
  end
  def find_internship
    @internships = current_user.internships
  end
end
