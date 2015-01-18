class CreateGithubStarEvents < ActiveRecord::Migration
  def change
    create_table :github_star_events do |t|
      t.string :uuid
      t.string :title
      t.string :happened_at
      t.string :url
      t.string :image_url

      t.timestamps null: false
    end

    add_index :github_star_events, :uuid
  end
end
