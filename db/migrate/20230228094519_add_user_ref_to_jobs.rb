class AddUserRefToJobs < ActiveRecord::Migration[7.0]
  def change
    add_reference :jobs, :user, null: false, foreign_key: true
    add_reference :jobs, :hitman, null: false, foreign_key: true
  end
end
