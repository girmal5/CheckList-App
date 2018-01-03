class AddDateTo < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :date,:text
  end
end
