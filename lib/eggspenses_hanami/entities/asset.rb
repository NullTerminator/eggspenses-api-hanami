class Asset < Hanami::Entity
  attributes do
    attribute :id,    Types::Int
    attribute :name,  Types::String
    attribute :count, Types::Int
  end
end
