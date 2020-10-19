class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
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
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def login
    err = params[:login_err].to_i
    @err_msg = nil
    if err == 419 && session['page'] == "login"
        @err_msg = "Invalid Email/ Password"
    end
end

def login_params
    params.fetch(:users, Hash.new).permit(:email, :password)
end

def signin
  session['page'] = nil
  email = login_params['email']
  password = login_params['password']
  result = {}
  ActiveRecord::Base.connection.exec_query(
      "SELECT * FROM users WHERE email='#{email}' AND password='#{password}'"
  ).each do|row| 
      result = {id: row['id'],fullname: row['fullname'],email: row['email'],user_role: row['user_role']}
  end
  
  if !result.empty?
      session['user'] = result
      redirect_to :action=>'dashboard'
      
  else
      session['page'] = "login"
      redirect_to action: 'login', login_err: 419
      #do some code here
  end
end

def logout
  session['user'] = nil
  redirect_to '/'
end

def dashboard
  @users = session['user']
  @project = Project.all()
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
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password)
    end
end
