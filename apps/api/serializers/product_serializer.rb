require_relative 'serializer'

module Api
  module Serializers
    class ProductSerializer < Serializer
      attributes :id, :name
      has_one :asset
    end
  end
end
