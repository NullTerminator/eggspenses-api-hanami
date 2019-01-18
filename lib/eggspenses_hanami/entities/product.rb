class Product < Hanami::Entity
  attributes do
    attribute :id,    Types::Int
    attribute :name,  Types::String
    #attribute :asset, Types::Class(Asset)
  end
end
