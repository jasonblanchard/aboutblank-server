class AddImageLinkAndIndexToDeliciousLinks < ActiveRecord::Migration
  def change
    add_index :delicious_events, :uuid
    add_column :delicious_events, :image_url, :string
  end
end
