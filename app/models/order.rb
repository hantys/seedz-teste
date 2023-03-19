class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :total, presence: true
  validates :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validates :total, numericality: { greater_than: 0 }
  validate :verify_stock

  before_validation :calc_total
  after_save :remove_stock

  def calc_total
    return unless product.present?

    aux_product = Product.find product_id
    self.total = amount * aux_product.price
  end

  def verify_stock
    if product.present?
      aux_product = Product.find product_id
      new_stock = aux_product.stock - amount
      return unless new_stock.negative?

      errors.add(:amount, 'não pode ser maior que o estoque')
    else
      errors.add(:product, 'não pode ser vazio')
    end
  end

  private

  def remove_stock
    new_stock = product.stock - amount
    product.update(stock: new_stock)
  end
end