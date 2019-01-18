class Production < Hanami::Entity
  attributes do
    attribute :id,    Types::Int
    attribute :count, Types::Int
    attribute :date,  Types::Date
    #attribute :product, Types::Class(Product)
  end
end
