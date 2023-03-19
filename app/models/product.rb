class Product < ApplicationRecord
  validates :name, presence: true
  validates :stock, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
end
