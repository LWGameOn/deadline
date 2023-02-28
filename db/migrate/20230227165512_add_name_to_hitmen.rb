class AddNameToHitmen < ActiveRecord::Migration[7.0]
  def change
    add_column :hitmen, :name, :string
  end
end
