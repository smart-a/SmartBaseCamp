class ProjectsController < ApplicationController
  before_action :require_user
  before_action :require_same_user
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  # before_action only: [:edit, :update, :destroy] do
  #   require_project_owner(@project)
  # end
  before_action only: [:show] do
    require_project_member(@project,@project_user)
  end
  

  require 'date'

  # GET /projects
  # GET /projects.json
  def index
    @user = User.find(params[:user_id])
    @projects = @user.projects.order('created_at DESC')
    @join_projects = @user.project_users.order('created_at DESC')
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @app_thread = AppThread.new
    @app_threads = @project.app_threads.order('created_at DESC')
    @project_users = @project.project_users.order('created_at DESC')
    @attachments = @project.attachments
  end

  # GET /projects/new
  def new
    @user = User.find(params[:user_id])
    @project = @user.projects.new
  end
 
  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @user = User.find(params[:user_id])
    @project =  @user.projects.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to [@user,@project], notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { redirect_to :new_user_project, notice: @project.errors }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to [@user,@project], notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to user_projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @user = User.find(params[:user_id])
      @project = Project.find(params[:id])
      @project_user = @project.project_users.find_by(user_id: params[:user_id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:user_id, :title, :description, :exp_completion_date, :completion_date)
    end

end
