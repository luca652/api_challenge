class AddLatitudeToMuseums < ActiveRecord::Migration[7.0]
  def change
    add_column :museums, :latitude, :float
  end
end
