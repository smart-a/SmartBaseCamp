class ThreadMessagesController < ApplicationController # Users::Projects::AppThreads::
  before_action :set_user_project_app_thread
  before_action :set_thread_message, only: [:show, :edit, :update, :destroy]

  # GET /thread_messages
  # GET /thread_messages.json
  def index
    @thread_messages = @app_thread.thread_messages
  end

  # GET /thread_messages/1
  # GET /thread_messages/1.json
  def show
  end

  # GET /thread_messages/new
  def new
    @thread_message =  @app_thread.thread_messages.new
  end

  # GET /thread_messages/1/edit
  def edit
  end

  # POST /thread_messages
  # POST /thread_messages.json
  def create
    @thread_message =  @app_thread.thread_messages.new(thread_message_params)

    respond_to do |format|
      if @thread_message.save
        format.html { redirect_to @thread_message, notice: 'Thread message was successfully created.' }
        format.json { render :show, status: :created, location: @thread_message }
      else
        format.html { render :new }
        format.json { render json: @thread_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /thread_messages/1
  # PATCH/PUT /thread_messages/1.json
  def update
    respond_to do |format|
      if @thread_message.update(thread_message_params)
        format.html { redirect_to @thread_message, notice: 'Thread message was successfully updated.' }
        format.json { render :show, status: :ok, location: @thread_message }
      else
        format.html { render :edit }
        format.json { render json: @thread_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thread_messages/1
  # DELETE /thread_messages/1.json
  def destroy
    @thread_message.destroy
    respond_to do |format|
      format.html { redirect_to thread_messages_url, notice: 'Thread message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thread_message
      @thread_message = ThreadMessage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def thread_message_params
      params.require(:thread_message).permit(:thread_id, :tm_content)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user_project_app_thread
      @user = User.find(params[:user_id])
      @project = @user.projects.find(params[:project_id])
      @app_thread = @project.app_threads.find(params[:app_thread_id])
    end
end
