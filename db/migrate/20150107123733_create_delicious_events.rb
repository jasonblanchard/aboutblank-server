class CreateDeliciousEvents < ActiveRecord::Migration
  def change
    create_table :delicious_events do |t|
      t.string :title
      t.string :uuid
      t.date :happened_at
      t.string :url

      t.timestamps null: false
    end
  end
end
