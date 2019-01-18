Hanami::Model.migration do
  change do
    create_table :assets do
      primary_key :id

      column :name, String, null: false
      column :count, Integer, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
