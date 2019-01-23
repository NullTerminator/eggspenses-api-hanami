class Expense < Hanami::Entity
  attributes do
    attribute :id,         Types::Int
    attribute :created_at, Types::DateTime
    attribute :updated_at, Types::DateTime

    attribute :name,       Types::String
    attribute :price,      Types::Float
    attribute :period,     Types::String
    attribute :start_date, Types::Date
    attribute :end_date,   Types::Date

    attribute :expensable_id,   Types::Int
    attribute :expensable_type, Types::String
    attribute :expensable,      Types::Class
  end
end
