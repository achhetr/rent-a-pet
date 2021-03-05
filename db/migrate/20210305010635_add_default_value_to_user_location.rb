class AddDefaultValueToUserLocation < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :location, 'Officer, Australia'
  end
end
