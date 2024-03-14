class User < ApplicationRecord
 	has_secure_password

 	validates :email, uniqueness: true, presence: true
 	validates :password, presence: true
	validates :name, uniqueness: true, presence: true

	scope :all_except, ->(user) { where.not(id: user) }

	after_create_commit { broadcast_append_to "users" }

	has_many :messages
	has_many :notifications, as: :recipient
	has_one :profile
end
