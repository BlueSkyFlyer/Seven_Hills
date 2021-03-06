class User < ActiveRecord::Base
	PASSWORD = "Hillspw2"

  has_many :posts
  has_many :shifts
  has_many :reservations

  has_secure_password validations: false

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true
  validates :password,
    presence: true,
    on: :create,
    length: { minimum: 5 }

  def member?
  	self.member
  end

  def admin?
    self.admin
  end
end