class CreateSubmissions < ActiveRecord::Migration[6.1]
  def change
    create_table :submissions do |t|
      t.jsonb :payload, default: {}, null: false
      t.integer :kind
      t.integer :state, default: 0, null: false

      t.timestamps
    end
  end
end
