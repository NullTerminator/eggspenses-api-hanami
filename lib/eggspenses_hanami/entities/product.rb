# I hate this, but requiring asset causes a circular dependency.
# I can remove the custom schema and let Hanami figure it out, but I want the explicit
# declaration of my entities and not magic under the covers.  For now this works because
# Ruby allows classes to be monkey patched.
class Asset < Hanami::Entity
end

class Product < Hanami::Entity
  attributes do
    attribute :id,         Types::Int
    attribute :created_at, Types::DateTime
    attribute :updated_at, Types::DateTime

    attribute :name,       Types::String

    attribute :asset_id,   Types::Int
    attribute :asset,      Types::Entity(Asset)
  end
end
