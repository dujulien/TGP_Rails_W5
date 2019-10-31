class Like < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :gossip, optional: true
	belongs_to :comment
end
