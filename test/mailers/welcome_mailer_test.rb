require "test_helper"

class WelcomeMailerTest < ActionMailer::TestCase
  test "send_grettings_notification" do
    mail = WelcomeMailer.send_grettings_notification
    assert_equal "Send grettings notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
