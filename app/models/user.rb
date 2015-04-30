class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	validates :email, presence: true, on: :create, uniqueness: true

	validates :password, presence: true, on: :create
	validates :password, confirmation: true
	validates :password_confirmation, presence: true
end
