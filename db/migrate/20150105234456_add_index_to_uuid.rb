class AddIndexToUuid < ActiveRecord::Migration
  def change
    add_index :goodreads_events, :uuid
  end
end
