class  Projects::AppThreadsController < ApplicationController
  before_action :set_app_thread, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:show, :edit, :new, :create, :update, :destroy]
  before_action :set_session

  # GET /app_threads
  # GET /app_threads.json
  def index
    @app_threads = AppThread.all
  end

  # GET /app_threads/1
  # GET /app_threads/1.json
  def show
  end

  # GET /app_threads/new
  def new
    @app_thread = AppThread.new
  end

  # GET /app_threads/1/edit
  def edit
  end

  # POST /app_threads
  # POST /app_threads.json
  def create
    @app_thread = AppThread.new(app_thread_params)
    @app_thread.project_id = @project.id

    respond_to do |format|
      if @app_thread.save
        format.html { redirect_to project_url(@project.id), notice: 'App thread was successfully created.' }
        format.json { render :show, status: :created, location: @app_thread }
      else
        format.html { render :new }
        format.json { render json: @app_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app_threads/1
  # PATCH/PUT /app_threads/1.json
  def update
    respond_to do |format|
      if @app_thread.update(app_thread_params)
        format.html { redirect_to project_url(@project.id), notice: 'App thread was successfully updated.' }
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
      format.html { redirect_to app_threads_url, notice: 'App thread was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_thread
      @app_thread = AppThread.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Only allow a list of trusted parameters through.
    def app_thread_params
      params.require(:app_thread).permit(:project_id, :th_content)
    end

    # Set session
    def set_session
      @user_session = session['user']
    end
end
