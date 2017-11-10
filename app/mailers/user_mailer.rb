class UserMailer < ActionMailer::Base
  default from: "info@test.com"

  def login_mail(user)
    @user = user
    mail(:to => user.email, :subject => "Account Verification Email")
  end

end
