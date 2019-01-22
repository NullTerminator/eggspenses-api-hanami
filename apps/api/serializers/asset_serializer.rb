require_relative 'serializer'

module Api
  module Serializers
    class AssetSerializer < Serializer
      attributes :id, :name
      has_many :products
    end
  end
end
