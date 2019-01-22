module Api
  module Serializers
    class Serializer

      class << self
        attr_accessor :serialize_attributes
        def attributes(*attrs)
          @serialize_attributes = attrs
        end

        def has_one(relation)
          has_ones << relation
        end

        def has_many(relation)
          has_manies << relation
        end

        def has_ones
          @has_ones ||= Set.new
        end

        def has_manies
          @has_many ||= Set.new
        end
      end

      def initialize(record)
        @record = record
      end

      def to_h
        {
          id: @record.id,
          type: Hanami::Utils::String.pluralize(@record.class.name.downcase),
          attributes: map_attrs,
          relationships: map_relationships
        }
      end

      private

      def map_attrs
        attrs = {}
        (self.class.serialize_attributes - [:id]).each do |attr|
          attrs[attr] = @record.public_send(attr)
        end
        attrs
      end

      def map_relationships
        relationships = {}

        self.class.has_ones.each do |rel|
          obj = @record.public_send(rel)
          data = {}
          if obj
            data[:id] = obj.id
            data[:type] = Hanami::Utils::String.pluralize(obj.class.name.downcase)
          end
          relationships[rel] = { data: data }
        end

        self.class.has_manies.each do |rel|
          objs = Array(@record.public_send(rel))
          relationships[rel] = {
            data: objs.map do |obj|
              {
                id: obj.id,
                type: Hanami::Utils::String.pluralize(obj.class.name.downcase)
              }
            end
          }
        end

        relationships
      end

    end
  end
end
