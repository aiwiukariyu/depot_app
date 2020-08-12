require "test_helper"

class SupportMailboxTest < ActionMailbox::TestCase
  # test "receive mail" do
  #   receive_inbound_email_from_mail \
  #     to: '"someone" <someone@example.com>',
  #     from: '"else" <else@example.com>',
  #     subject: "Hello world!",
  #     body: "Hello?"
  # end
  test "we create a SupportRequest when we get a support email" do
    receive_inbound_email_from_mail(
      to: "vox.e.povi@gmail.com",
      from: "chris@somewhere.net",
      subject: "Need help",
      body: "I can't figure out how to check out!!"
    )
    
  support_request = SupportRequest.last
  assert_equal "chris@somewhere.net", support_request.email
  assert_equal "Need help", support_request.subject
  assert_equal "I can't figure out how to check out!!", support_request.body
  assert_nil support_request.order
  end
end
