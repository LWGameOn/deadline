class AddJobRefToMessages < ActiveRecord::Migration[7.0]
  def change
    add_reference :messages, :job, null: false, foreign_key: true
  end
end
