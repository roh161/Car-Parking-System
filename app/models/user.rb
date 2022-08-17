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

  def self.search(search)
    where("lower(user.name) LIKE :search", search: "%#{search.downcase}%").uniq
  end

  enum :user_type, [:admin, :user], default: :user
end
