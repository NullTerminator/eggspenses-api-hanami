require_relative 'asset'

class AssetEvent < Hanami::Entity
  attributes do
    attribute :id,         Types::Int
    attribute :created_at, Types::DateTime
    attribute :updated_at, Types::DateTime

    attribute :count,      Types::Int
    attribute :date,       Types::Date

    attribute :asset_id,   Types::Int
    attribute :asset,      Types::Entity(Asset)
  end
end
