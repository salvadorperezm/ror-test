class ProductSerializer < ActiveModel::Serializer
  attributes :id, :sku, :name, :description, :stock, :status
  belongs_to :brand
  belongs_to :category
end
