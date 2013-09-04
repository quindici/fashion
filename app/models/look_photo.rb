class LookPhoto < ActiveRecord::Base
	validates :look_id, presence: true

	belongs_to :look
end
