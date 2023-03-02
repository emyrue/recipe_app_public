require 'mini_magick'

class Recipe < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :user
  validates :name, presence: true
  validates :ingredients, presence: true
  validates :directions, presence: true
end
