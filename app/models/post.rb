class Post < ActiveRecord::Base
  belongs_to :city
    belongs_to :user


  # extend FriendlyId
  # friendly_id :title, use: :slugged
end

