require_relative 'product'
require_relative 'expense'

class SaleItem < Hanami::Entity
  attributes do
    attribute :id,         Types::Int
    attribute :created_at, Types::DateTime
    attribute :updated_at, Types::DateTime

    attribute :name,          Types::String
    attribute :price,         Types::Float
    attribute :product_count, Types::Int

    attribute :product_id, Types::Int
    attribute :product,    Types::Entity(Product)

    attribute :expenses,   Types::Collection(Expense)
  end
end
