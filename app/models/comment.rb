class Comment < ActiveRecord::Base
	# Do not check if user id is present
	# This is because we would still like to retain the comment even if an user opts out
	# validates :user_id, presence: true
	validates :look_id, presence: true
	validates :text, length: {maximum: 1400}

	belongs_to :user
	belongs_to :look
end
