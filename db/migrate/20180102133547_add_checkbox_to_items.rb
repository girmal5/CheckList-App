class AddCheckboxToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :checkbox, :boolean , :default => false
end
end 
