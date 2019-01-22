require_relative 'product'

class Production < Hanami::Entity
  attributes do
    attribute :id,         Types::Int
    attribute :created_at, Types::DateTime
    attribute :updated_at, Types::DateTime

    attribute :count,      Types::Int
    attribute :date,       Types::Date

    attribute :product_id, Types::Int
    attribute :product,    Types::Entity(Product)
  end
end
