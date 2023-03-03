class AddNumberOfTargetsColumnToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :target_number, :integer, :default => 1
  end
end
