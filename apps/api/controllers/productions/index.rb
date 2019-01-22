module Api
  module Controllers
    module Productions
      class Index
        include Api::Action
        accept :json

        expose :productions

        def initialize(interactor: LoadProductions.new)
          @interactor = interactor
        end

        def call(params)
          @productions = @interactor.call(params.to_h.select { |k, v| [:from_date, :to_date].include?(k) }).productions
        end
      end
    end
  end
end
