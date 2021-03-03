class RemoveColumnImageUrlFromPet < ActiveRecord::Migration[6.0]
  def change
    remove_column :pets, :image_url
  end
end
