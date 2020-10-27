class MessagesController < ApplicationController #Users::Projects::AppThreads::ThreadMessages::
  before_action :require_user
  before_action :require_same_user
  
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :set_user_project

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = @app_thread.messages.new(message_params)
    @message.user_id = @user.id

    respond_to do |format|
      if @message.save
        format.js {}
        format.html { redirect_to user_project_app_thread_url(@user, @project, @app_thread), notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { redirect_to  user_project_app_thread_url(@user, @project, @app_thread), notice: @message.errors.full_messages.inspect }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to [@user,@project,@app_thread], notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message =Message.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user_project
      @user = User.find(params[:user_id])
      @project = @user.projects.find(params[:project_id])
      @app_thread = @project.app_threads.find(params[:app_thread_id])
    end

    # Only allow a list of trusted parameters through.
    def app_thread_params
      params.require(:app_thread).permit(:project_id, :th_content)
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:msg_content, :message_id)
    end
end
