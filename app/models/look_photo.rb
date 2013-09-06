class LookPhoto < ActiveRecord::Base
	has_attached_file :photo, :styles => { :large => "800x800>", :medium => "300x300>" }, 
  		:default_url => "/images/:style/missing.png",
  		:url => "/system/:class/:attachment/:id/:basename_:style.:extension",
  		:path => ":rails_root/public/system/:class/:attachment/:id/:basename_:style.:extension"

  belongs_to :look
  		
	#validates :look_id, presence: true
	validates :description, length: {maximum: 140}
    # validates_with AttachmentSizeValidator, attributes: :photo, 
   	# 	less_than: 5.megabyte,
   	# 	:unless=> Proc.new { |image| image[:photo].nil? }
    # validates_with AttachmentContentTypeValidator, attributes: :photo, 
    # 	content_type: ['image/jpeg', 'image/png', 'image/gif'],
    # 	:unless=> Proc.new { |image| image[:photo].nil? }
    # validates_with AttachmentPresenceValidator, attributes: :photo,
    #   presence: true
  validates_attachment :photo, presence: true,
    content_type: {content_type: ['image/jpeg', 'image/png', 'image/gif']},
    size: {less_than: 5.megabyte},
    unless: Proc.new { |image| image[:photo].nil? }	

end
