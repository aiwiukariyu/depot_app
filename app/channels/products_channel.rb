class ProductsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "product"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
