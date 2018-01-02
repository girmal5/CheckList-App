class ManagerdescToItems < ActiveRecord::Migration[5.1]
  def change

    add_column :items, :managerdesc, :text
  end
end
