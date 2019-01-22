require_relative 'product'

class Asset < Hanami::Entity
  attributes do
    attribute :id,       Types::Int
    attribute :name,     Types::String
    attribute :products, Types::Collection(Product)
  end
end
