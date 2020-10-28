class AdminController < ApplicationController
  layout 'layouts/admin_layout'
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  # GET /admins/1
  # GET /admins/1.json
  # def show
  # end

  # GET /admins/new_user
  def new_user
    
  end

  # GET /admins/1/edit
  def edit
   
  end

  # # POST /admins
  # # POST /admins.json
  # def create
  #   @admin = Admin.new(admin_params)

  #   respond_to do |format|
  #     if @admin.save
  #       format.html { redirect_to @admin, notice: 'Admin was successfully created.' }
  #       format.json { render :show, status: :created, location: @admin }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @admin.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /admins/1
  # # PATCH/PUT /admins/1.json
  # def update
  #   respond_to do |format|
  #     if @admin.update(admin_params)
  #       format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @admin }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @admin.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /admins/1
  # # DELETE /admins/1.json
  # def destroy
  #   @admin.destroy
  #   respond_to do |format|
  #     format.html { redirect_to admins_url, notice: 'Admin was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_params
      params.fetch(:admin, {})
    end

     # Set session
     def set_session
      # @user_session = session['user']
      @user_session = session['user'] = {firstname:'Adesoye', lastname:'Olalekan', email:'admin@smartbasecamp.com', user_role:'admin'}
    end
end
