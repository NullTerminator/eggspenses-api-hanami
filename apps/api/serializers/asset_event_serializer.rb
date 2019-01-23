require_relative 'serializer'

module Api
  module Serializers
    class AssetEventSerializer < Serializer
      attributes :id, :count, :date
      has_one :asset
    end
  end
end
