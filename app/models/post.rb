class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :file
  has_many_attached :images
end
