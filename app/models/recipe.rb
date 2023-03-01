require 'mini_magick'

class Recipe < ApplicationRecord
  include ImageUploader::Attachment(:image) # adds an `image` virtual attribute
  belongs_to :user
  validates :name, presence: true
  validates :ingredients, presence: true
  validates :directions, presence: true

  def generate_thumbnail
    image_url(:small)
  end
end
