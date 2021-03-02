class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.text :description
      t.string :type
      t.string :image_url
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
