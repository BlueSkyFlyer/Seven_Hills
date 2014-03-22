class Student < ActiveRecord::Base
	has_one :opening

	has_many :groups
	has_many :reservations, through: :groups

	validates_presence_of :first_name, :last_name, :email, :phone, :age, :street_address, :city, :state

	validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 18}
	validates :state, length: { is: 2 }
end