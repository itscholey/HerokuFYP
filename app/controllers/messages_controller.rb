class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to :back
    else
      render 'new'
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :sender_id, :conversation_id, recipient_ids: [])
  end

end
