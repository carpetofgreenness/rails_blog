class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy

	validates_inclusion_of :user_id, in: User.all.map(&:id)
end
