Hanami::Model.migration do
  change do
    create_table :products do
      primary_key :id

      column :name, String, null: false

      foreign_key :asset_id, :assets, on_delete: :cascade, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
