class Gossip < ApplicationRecord
	belongs_to :author, class_name: "User"
	has_many :join_gossip_tags
	has_many :tags, through: :join_gossip_tags
end
