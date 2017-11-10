class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64(3)
    end while User.exists?(column => self[column])
  end

 def send_confirmation_email
    generate_token(:email_verification_code)
    save!
    UserMailer.login_mail(self).deliver
  end

end
