require_relative 'serializer'

module Api
  module Serializers
    class ExpenseSerializer < Serializer
      attributes :id, :name, :price, :period, :start_date, :end_date
      has_one :expensable
    end
  end
end
