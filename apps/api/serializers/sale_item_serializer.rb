require_relative 'serializer'

module Api
  module Serializers
    class SaleItemSerializer < Serializer
      attributes :id, :name, :price, :product_count
      has_one :product
      has_many :expenses
    end
  end
end
