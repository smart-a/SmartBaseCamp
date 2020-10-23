class UsersController < ApplicationController
  before_action :set_session  
  before_action :set_user, only: [:show, :edit, :update, :destroy]
 
  def home
    # @user_session = nil
    # @user_login = nil
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @project = @user.projects
  end

  # GET /users/new
  def new
    # @user_session = nil
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to :users_login, flash[:notice] => 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render action:'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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
      session['user'] = @user_login
      format.html { redirect_to user_projects_path(@user_login[:id]) }
      format.json { render :show, status: :ok, location: @user_login }
    else
      format.html { redirect_to :users_login, notice: 'Invalid user login.' }
      format.json { render json: @user_login.errors, status: :unprocessable_entity }
    end
  end

end

def logout
  session['user'] = nil
  redirect_to '/'
end

# def update
#   @users = User.find(params[:id])
#   if @users.update(update_params)
#       redirect_to action: 'set_user', notice: "1", id: @users
#   else
#       redirect_to action: 'set_user', notice: "0", id: @users
#   end
# end


  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password)
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    
    # Set session
    def set_session
      @user_session = nil
      if !session['user'].nil?
        @user_session = session['user']
      end
    end
end
