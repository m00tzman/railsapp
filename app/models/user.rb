class User < ActiveRecord::Base
	has_secure_password

	validates :email, presence: true, on: :create, uniqueness: true

	validates :password, presence: true, on: :create
	validates :password, confirmation: true
	validates :password_confirmation, presence: true
end
