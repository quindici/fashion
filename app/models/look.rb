class Look < ActiveRecord::Base
	validates :user_id, presence: true
	validates :description, length: {maximum: 140}


	belongs_to :user
	
	default_scope -> {order('created_at DESC')}
	has_many :lookPhotos, dependent: :destroy
	has_many :comments, dependent: :destroy
	
	accepts_nested_attributes_for :lookPhotos, 
		reject_if: lambda {|a| a[:photo].nil? },
		allow_destroy: true

	accepts_nested_attributes_for :comments,
		reject_if: lambda {|a| a[:text].nil? && a[:score].nil?},
		allow_destroy: true
end
