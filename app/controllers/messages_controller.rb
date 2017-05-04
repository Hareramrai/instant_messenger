class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: [:show, :edit, :update, :destroy]


  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.includes(:user, :dialect).order("created_at desc").all
    @users = User.order("username")
    @message = Message.new
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.dialect = current_user.dialect

    respond_to do |format|
      if @message.save
        format.html
        format.js 
        format.json { render :show, status: :created, location: @message }
      else
        format.html
        format.js { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:user_id, :dialect_id, :body)
    end
end
