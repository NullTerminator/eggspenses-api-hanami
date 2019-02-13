module Api
  module Controllers
    module Productions
      class Create
        include Api::Action
        accept :json

        expose :production

        def initialize(interactor: CreateProduction.new)
          @interactor = interactor
        end

        def call(params)
          @production = @interactor.call(params.to_h.select { |k, v| [:product_id, :count, :date].include?(k) }).production
        end
      end
    end
  end
end
