class CreateGoodreadsEvents < ActiveRecord::Migration
  def change
    create_table :goodreads_events do |t|
      t.string :uuid
      t.date :happened_at
      t.string :image_url
      t.string :url
      t.string :title

      t.timestamps null: false
    end
  end
end
