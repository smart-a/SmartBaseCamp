class PagesController < ApplicationController

    def home
    end

    def new
        @user = User.new
    end

    def login
    end
  
    def login_params
        params.fetch(:users, Hash.new).permit(:email, :password)
    end
  
    def signin
      email = login_params['email']
      password = login_params['password']
      @user_login = User.find_by(email: email, password: password) #where(email: email, password: password)
  
      respond_to do |format|
        if !@user_login.nil?
          session['user_id'] = @user_login[:id]
          format.html { redirect_to user_projects_path(@user_login[:id]) }
          format.json { render :show, status: :ok, location: @user_login }
        else
          format.html { redirect_to :login, notice: 'Invalid user login.' }
          format.json { render json: @user_login.errors, status: :unprocessable_entity }
        end
      end
  
    end
  
    def logout
      session['user_id'] = nil
    #   current_user = false
      redirect_to '/'
    end

    # Only allow a list of trusted parameters through.
    def user_params
        params.require(:user).permit(:firstname, :lastname, :email, :password)
    end
end
