class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.all
  end

  def new
    @conversation = Conversation.new
  end

  def create
    @conversation = Conversation.new(conversation_params)
    if @conversation.save
      render 'show'
    else
      render 'new'
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
  end

  def destroy
    Conversation.find(params[:id]).destroy
    flash[:success] = "Conversation deleted"
    redirect_to conversations
  end

  private

  def conversation_params
    params.require(:conversation).permit(user_ids: [])
  end
end
