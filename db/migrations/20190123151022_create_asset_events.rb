Hanami::Model.migration do
  change do
    create_table :asset_events do
      primary_key :id

      column :count, Integer, null: false
      column :date, Date, null: false

      foreign_key :asset_id, :assets, on_delete: :cascade, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
