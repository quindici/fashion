class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :tinythumb => "50x50#" }, 
      :default_url => "/images/avatar/:style/missing.png",
      :url => "/system/:class/:attachment/:id/:style.:extension",
      :path => ":rails_root/public/system/:class/:attachment/:id/:style.:extension"

  has_many :looks, dependent: :destroy
  has_many :comments

  # validates(:email, presence: true )
  validates :display_name, presence: true, length: { maximum: 30, too_long: "%{count} characters is the max allowed for display name" }
  validates_with AttachmentSizeValidator, attributes: :avatar, 
    less_than: 5.megabyte,
    :unless=> Proc.new { |image| image[:avatar].nil? }
  validates_with AttachmentContentTypeValidator, attributes: :avatar, 
    content_type: ['image/jpeg', 'image/png', 'image/gif'],
    :unless=> Proc.new { |image| image[:avatar].nil? }


end