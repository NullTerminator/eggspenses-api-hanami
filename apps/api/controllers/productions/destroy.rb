module Api
  module Controllers
    module Productions
      class Destroy
        include Api::Action
        accept :json

        def initialize(interactor: DeleteProduction.new)
          @interactor = interactor
        end

        def call(params)
          @production = @interactor.call(params[:id])
        end
      end
    end
  end
end
