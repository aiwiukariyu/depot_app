class OrderMailer < ApplicationMailer
  default from: '<vox.e.povi@gmail.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.received.subject
  #
  def received(order)
    @order = order
    mail to: order.email, subject: 'Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.shipped.subject
  #
  def shipped(order)
    @order = order
    content_type "multipart/alternative"
    mail to: order.email, subject: 'Order Shipped'
  end
  
  def demo
    mail to: ENV['USER_MAIL'], subject: 'This is a test'
  end
end
