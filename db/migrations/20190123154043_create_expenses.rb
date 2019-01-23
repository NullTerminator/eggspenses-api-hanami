Hanami::Model.migration do
  change do
    create_table :expenses do
      primary_key :id

      column :name, String, null: false
      column :price, Float, null: false
      column :period, String
      column :start_date, Date
      column :end_date, Date

      column :expensable_type, String, null: false
      column :expensable_id, Integer, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
