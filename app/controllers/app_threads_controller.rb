class  AppThreadsController < ApplicationController
  before_action :require_user
  before_action :require_same_user

  before_action :set_user_project
  before_action :set_app_thread, only: [:show, :edit, :update, :destroy]

  # GET /app_threads
  # GET /app_threads.json
  def index
    @app_threads = @project.app_threads
  end

  # GET /app_threads/1
  # GET /app_threads/1.json
  def show
    @messages = @app_thread.messages.where(message_id: nil)
  end

  # GET /app_threads/new
  def new
    @app_thread = @project.app_threads.new
  end

  # GET /app_threads/1/edit
  def edit
  end

  # POST /app_threads
  # POST /app_threads.json
  def create
    @app_thread = @project.app_threads.new(app_thread_params)
    @app_thread.user_id = @user.id

    respond_to do |format|
      if @app_thread.save
        format.js {}
        format.html { redirect_to user_project_url(@user,@project), notice: 'Thread was successfully created.' }
        format.json { render :show, status: :created, location: @app_thread }
      else
        format.html { redirect_to user_project_url(@user,@project), notice: @app_thread.errors.full_messages.inspect}
        format.json { render json: @app_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app_threads/1
  # PATCH/PUT /app_threads/1.json
  def update
    respond_to do |format|
      if @app_thread.update(app_thread_params)
        format.html { redirect_to user_project_url(@user, @project), notice: 'Thread was successfully updated.' }
        format.json { render :show, status: :ok, location: @app_thread }
      else
        format.html { render :edit }
        format.json { render json: @app_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_threads/1
  # DELETE /app_threads/1.json
  def destroy
    @app_thread.destroy
    respond_to do |format|
      format.html { redirect_to user_project_path(@user,@project), notice: 'Thread was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_thread
      @app_thread = @project.app_threads.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user_project
      @user = User.find(params[:user_id])
      @project = @user.projects.find(params[:project_id])
    end

    # Only allow a list of trusted parameters through.
    def app_thread_params
      params.require(:app_thread).permit(:project_id, :th_content)
    end


end
