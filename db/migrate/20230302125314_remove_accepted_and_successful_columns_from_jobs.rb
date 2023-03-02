class RemoveAcceptedAndSuccessfulColumnsFromJobs < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :accepted
    remove_column :jobs, :completed
    add_column :jobs, :status, :integer, :default => 0
  end
end
