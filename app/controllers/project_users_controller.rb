class ProjectUsersController < ApplicationController
  # before_action :set_user, only:[:show]
  before_action :set_user_project
  before_action :set_project_user,only: [:show, :edit, :destroy]
  before_action :set_session


    def index 
        @project_users = @project.project_users
        # @users=User.all
        

        # @users = @user.project_users
        # @user = User.find(params[:user_id])
    end

    
    
     
      def new
        @project_user = @project.project_users.new
        # @project_user = ProjectUser.new

      end
    
    
      def edit
      end
    
      
      def create
        @new_user = User.find_by(email: params[:email])
        if !@new_user.nil?
        
            @project_user = @project.project_users.new(user_id:@new_user.id)
        
            respond_to do |format|
              if @project_user.save
                format.html { redirect_to user_project_url(@user,@project), notice: 'User was successfully added to project.' }
                format.json { render :show, status: :created, location: @project_user}
              else
                format.html { render :new }
                format.json { render json: @project_user.errors, status: :unprocessable_entity }
              end
            end
        else
          render :new, notice: 'User with such email does not exist.' 
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
          @project_user = @project.project_users.find(params[:id])
        end
    
         # Use callbacks to share common setup or constraints between actions.
         def set_user_project
          @user = User.find(params[:user_id])
          @project = @user.projects.find(params[:project_id])
        end
    
        # Only allow a list of trusted parameters through.
        def project_user_params
          params.require(:project_user).permit(:project_id, :user_id)
        end
    
        # Set session
        def set_session
          @user_session = session['user']
        end
end
      

