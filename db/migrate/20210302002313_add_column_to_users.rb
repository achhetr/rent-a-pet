class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :mobile, :string
    add_column :users, :location, :string
    add_column :users, :image_url, :string
    add_column :users, :type, :string
  end
end
