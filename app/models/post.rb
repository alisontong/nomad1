class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :city

  validates :name, length: { minimum: 2, maximum: 255 }, presence: true
  validates :username, length: { minimum: 3, maximum: 255 }, presence: true
  validates :password, length: { in: 6..20 }, presence: true
  validates :email, length: { maximum: 255 }, presence: true



  # extend FriendlyId
  # friendly_id :title, use: :slugged
end

