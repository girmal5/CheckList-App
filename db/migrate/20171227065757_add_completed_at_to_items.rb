class AddCompletedAtToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :completed_at, :datetime
  end
end
