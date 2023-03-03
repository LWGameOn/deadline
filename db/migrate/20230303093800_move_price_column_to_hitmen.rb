class MovePriceColumnToHitmen < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :price
    add_column :hitmen, :price, :decimal
  end
end
