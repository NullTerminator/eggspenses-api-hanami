require_relative 'product'

class Asset < Hanami::Entity
  attributes do
    attribute :id,         Types::Int
    attribute :created_at, Types::DateTime
    attribute :updated_at, Types::DateTime

    attribute :name,       Types::String

    attribute :products,   Types::Collection(Product)
  end
end
