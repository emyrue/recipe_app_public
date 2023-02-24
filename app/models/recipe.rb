class Recipe < ApplicationRecord
  include ImageUploader::Attachment(:image) # adds an `image` virtual attribute
  belongs_to :user
  validates :name, presence: true
  validates :ingredients, presence: true
  validates :directions, presence: true
end
