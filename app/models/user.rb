class User < ApplicationRecord
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	validates_presence_of :first_name, :last_name, :email, :password
	validates :email, uniqueness: true
	validates :email, confirmation: true
	validates :email_confirmation, presence: true
end
