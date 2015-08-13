class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy 

  has_secure_password

  validates :name, length: { minimum: 2 }, presence: true
  validates :username, length: { minimum: 3 }, presence: true
  validates :password, length: { in: 6..20 }, presence: true
  validates :email, length: { maximum: 255 }, presence: true


  extend FriendlyId
  friendly_id :username, use: :slugged

  # :styles => { :medium => "150x150>", :thumb => "44x44#>" },
  #              :storage => :s3,
  #              :s3_credentials => Proc.new { |a| a.instance.s3_credentials },
  #              :path => "avatars/:id/:style/avatar.:extension",
  #              :default_url => "https://s3.amazonaws.com/nomadga/defaults/default_avatar.png"

  # validates_attachment :avatar, :presence => true,
  #                       :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
  #                       :size => { :in => 0..1000.kilobytes }
  def s3_credentials
    {:bucket => ENV['S3_BUCKET'], :access_key_id => ENV['S3_PUBLIC_KEY'], :secret_access_key => ENV['S3_SECRET']}
  end
end
