class User < ActiveRecord::Base
  # validates(:email, presence: true )
  validates :display_name, presence: true, length: { maximum: 30, too_long: "%{count} characters is the max allowed for display name" }
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  has_many :looks
end
