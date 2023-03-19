class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :stock, :price
end
