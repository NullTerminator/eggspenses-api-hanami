require_relative 'product'

class Production < Hanami::Entity
  attributes do
    attribute :id,      Types::Int
    attribute :count,   Types::Int
    attribute :date,    Types::Date
    attribute :product, Types::Entity(Product)
  end
end
