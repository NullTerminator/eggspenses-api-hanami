module Api
  module Controllers
    module Productions
      class Update
        include Api::Action
        accept :json

        expose :production

        def initialize(interactor: UpdateProduction.new)
          @interactor = interactor
        end

        def call(params)
          @production = @interactor.call(params[:id], params.to_h.select { |k, v| [:product_id, :count, :date].include?(k) }).production
        end
      end
    end
  end
end
