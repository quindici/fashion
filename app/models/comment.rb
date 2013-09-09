class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :look

	# Do not check if user id is present
	# This is because we would still like to retain the comment even if an user opts out
	# validates :user_id, presence: true
	validates :look_id, presence: true
	validates :text, presence: true, length: {maximum: 1400}


end
