class AddDefaultValueToHitmanPrice < ActiveRecord::Migration[7.0]
  def change
    change_column :hitmen, :price, :decimal, :default => 0
  end
end
