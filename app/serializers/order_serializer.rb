class OrderSerializer < ActiveModel::Serializer
  attributes :id, :amount, :total
  has_one :user
  has_one :product
end
