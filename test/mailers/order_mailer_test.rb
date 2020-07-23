require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Order Confirmation", mail.subject
    assert_equal ["mail@mailbox.com"], mail.to
    assert_equal ["vox.e.povi@gmail.com"], mail.from
    assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "Order Shipped", mail.subject
    assert_equal ["mail@mailbox.com"], mail.to
    assert_equal ["vox.e.povi@gmail.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
