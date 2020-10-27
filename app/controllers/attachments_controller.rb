class AttachmentsController < ApplicationController
  before_action :require_user
  before_action :set_user_project
  before_action :set_session
 

  def index
    @attachment = Attachment.new
    @attachments = @project.attachments
  end

  def new
    # @attachment = @project.attachments.new
  end

  def create
    @attachment = @project.attachments.new(attach_params)
    if @attachment.save
      redirect_to user_project_attachments_path, notice: "The attachment #{@attachment.name} has been uploaded."
   else
      redirect_to user_project_attachments_path, notice: @attachment.errors.full_messages
   end
  end

  def destroy
    @attachment = @project.attachments.find(params[:id])
    @attachment.destroy
    respond_to do |format|
      format.html { redirect_to user_project_attachments_path, notice:  "The attachment #{@attachment.name} has been deleted."  }
    end
    
    
  end

  private

  def attach_params
    params.require(:attachment).permit(:name, :path)
  end

  #  Use callbacks to share common setup or constraints between actions.
  def set_user_project
    @user = User.find(params[:user_id])
    @project = @user.projects.find(params[:project_id])
  end

  # Set session
  def set_session
    @user_session = session['user']
  end
end



  

# end
