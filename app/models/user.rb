class User < ApplicationRecord
	rolify

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => {logo: "195x54", large: "600x600", medium: "300x300>", thumb: "100x100>" },
  :path => "/files/:style/:id_:filename",
  :default_url => "/images/:style/missing.png",
  :storage => :s3,
  :url => 's3_domain_url',
  :s3_host_alias => 'elslearning.s3-website-us-east-1.amazonaws.com'

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :playlists
  has_many :events


  def email_required?
  	false
  end

end