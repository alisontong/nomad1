class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :city


  # extend FriendlyId
  # friendly_id :title, use: :slugged
end

