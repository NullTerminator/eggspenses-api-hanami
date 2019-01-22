require_relative 'serializer'

module Api
  module Serializers
    class ProductionSerializer < Serializer
      attributes :id, :count, :date
      has_one :product
    end
  end
end
