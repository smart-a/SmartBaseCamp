class ProjectUsersController < ApplicationController
  before_action :set_user_project, only: [:show, :new, :create, :index, :destroy]
  before_action :set_project_user, only: [:destroy]

  before_action only: [:show] do
    require_project_member(@project,@project_user)
  end
  before_action only: [:edit, :update, :destroy] do
    require_project_owner(@project)
  end


  def index 
    # @project_user = @project.project_users.new
    @project_users = @project.project_users
    @project_user = ProjectUser.new
  end  

  def new
    @project_user = @project.project_users.new
  end
  
  def create
    @new_user = User.find_by(email: project_user_params[:email])

    if @new_user

      if @new_user[:id] == current_user.id 
        redirect_to user_project_project_users_url(@user,@project), notice: 'You are already a member of this project.' 
        return
      end
    
        @project_user = @project.project_users.new(user_id: @new_user[:id])
    
        respond_to do |format|
          if @project_user.save
            format.html { redirect_to user_project_url(@user,@project), notice: 'User was successfully added to project.' }
            format.json { render :show, status: :created, location: @project_user}
          else
            format.html { render :index }
            format.json { render json: @project_user.errors, status: :unprocessable_entity }
          end
        end
    else
      redirect_to user_project_project_users_url(@user,@project), notice: 'User with such email does not exist.' 
    end
  end
  
  def destroy
    @project_user.destroy
    respond_to do |format|
      format.html { redirect_to user_project_project_users_path, notice: 'User was successfully removed.' }
      format.json { head :no_content }
    end
  end

      
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_user
      @project_user = ProjectUser.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user_project
      @user = User.find(params[:user_id])
      @project = @user.projects.find(params[:project_id])
    end

    # Only allow a list of trusted parameters through.
    def project_user_params
      params.require(:project_user).permit(:email)
    end

    # Set session
    def set_session
      @user_session = session['user']
    end
end