class Ingredient < ApplicationRecord
  belongs_to :recipe
  validates :name, presence: true
  validates :unit, presence: true
  validates :quantity, presence: true
end
