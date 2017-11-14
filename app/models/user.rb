class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
  has_attached_file :image, styles: {medium:"728x391#" ,thumb: "53x53#" ,small:"250x111#"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
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
