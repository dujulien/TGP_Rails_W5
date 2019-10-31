class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :gossip
	belongs_to :commentable, polymorphic: true, optional: true
	has_many :likes
	has_many :comments, as: :commentable
	validates :content, presence: true
end
