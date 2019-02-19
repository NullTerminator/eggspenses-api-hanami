module Api
  module Views
    module Productions
      class Update
        include Api::View
        layout false

        def serializer
          Serializers::ProductionSerializer
        end

        def render
          _raw Hash[data: serializer.new(production).to_h].to_json
        end
      end
    end
  end
end
