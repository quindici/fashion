class Look < ActiveRecord::Base
	validates :user_id, presence: true
	validates :description, length: {maximum: 140}


	belongs_to :user
	default_scope -> {order('created_at DESC')}
	has_many :lookPhotos, dependent: :destroy
end
