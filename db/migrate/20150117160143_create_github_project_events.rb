class CreateGithubProjectEvents < ActiveRecord::Migration
  def change
    create_table :github_project_events do |t|
      t.string :uuid
      t.string :title
      t.date :happened_at
      t.string :url
      t.string :image_url

      t.timestamps null: false
    end

    add_index :github_project_events, :uuid
  end
end
