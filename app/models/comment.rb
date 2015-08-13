class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :description, length: { minimum: 3, maximum: 255 }, presence: true
end
