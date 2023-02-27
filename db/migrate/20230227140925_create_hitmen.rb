class CreateHitmen < ActiveRecord::Migration[7.0]
  def change
    create_table :hitmen do |t|
      t.string :name
      t.string :method
      t.text :bio
      t.string :location

      t.timestamps
    end
  end
end
