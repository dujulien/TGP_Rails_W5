class User < ApplicationRecord
	belongs_to :city
	has_many :gossips
	has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
	has_many :received_messages, foreign_key: 'recipient_id', class_name: "RecipientList"
	has_many :comments
	validates :first_name, presence: {message: "must exist"} 
	validates :last_name, presence: {message: "must exist"} 
	validates :age, presence: {message: "must exist"} 
	validates :email, 
		presence: {message: "must be indicated"},
		uniqueness: {message: "already exists"},
		format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Enter a valid email format xxx@yyy.zzz" }
end
