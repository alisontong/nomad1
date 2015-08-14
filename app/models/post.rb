class Post < ActiveRecord::Base
  belongs_to :city
  belongs_to :user

  has_many :comments, dependent: :destroy
  

  validates :title, length: { minimum: 2, maximum: 255 }, presence: true
  validates :description, length: { minimum: 3, maximum: 255 }, presence: true
 
  acts_as_taggable
  


  # extend FriendlyId
  # friendly_id :title, use: :slugged
end

