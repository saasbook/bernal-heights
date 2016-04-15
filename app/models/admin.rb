class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :registerable, :validatable
  validates :name, presence: true
  
  def update_with_password(admin_params)
    current_password = admin_params.delete(:current_password)

    if self.authenticate(current_password)
      self.update(admin_params)
      true
    else
      self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      false
    end
  end
  
  def authenticate(password)
    return password == self.password
  end
end
