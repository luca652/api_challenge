class AddNameToMuseums < ActiveRecord::Migration[7.0]
  def change
    add_column :museums, :name, :string
  end
end
