class UserloggedinChannel < ApplicationCable::Channel
  def subscribed
    stream_from "userloggedin"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
