class Score < ActiveRecord::Base
	belongs_to :user
	belongs_to :look
	# How to represent there will only be one score for a given user and a given look?

	validates :look_id, presence: true
	validates :user_id, presence: true
	validates :score, presence: true
end
