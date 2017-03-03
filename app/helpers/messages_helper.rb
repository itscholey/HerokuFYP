module MessagesHelper

  def mark_as_read(message)
    message.read = true
    message.save
  end
end
