class CreateHitmen < ActiveRecord::Migration[7.0]
  def change
    create_table :hitmen do |t|
      t.references :user, null: false, foreign_key: true
      t.string :method
      t.text :bio
      t.string :location

      t.timestamps
    end
  end
end
