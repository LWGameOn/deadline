class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.text :details
      t.date :deadline
      t.string :location
      t.boolean :completed, :default => false
      t.decimal :price
      t.boolean :accepted, :default => false
      t.boolean :paid, :default => false
      t.decimal :rating
      t.text :review

      t.timestamps
    end
  end
end
