class LookPhoto < ActiveRecord::Base
	validates :look_id, presence: true
	validates :description, length: {maximum: 140}

	belongs_to :look
end
