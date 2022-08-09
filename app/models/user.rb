class User < ApplicationRecord
  has_many :vehicles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable,
         :confirmable,
         :trackable
 
  private

  def after_confirmation
    WelcomeMailer.send_grettings_notification(self)
                 .deliver_now
  end

  

  enum :user_type, [:admin, :user], default: :user
end
