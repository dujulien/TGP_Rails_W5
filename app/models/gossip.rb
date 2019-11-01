class Gossip < ApplicationRecord
	belongs_to :user
	has_many :join_gossip_tags
	has_many :tags, through: :join_gossip_tags
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	validates :title, 
		presence: true,
		length: {in: 3..50, message: "length must be between 3 and 50 characters long"}
	validates :content,
		presence: {message: "must exist"} 
end
