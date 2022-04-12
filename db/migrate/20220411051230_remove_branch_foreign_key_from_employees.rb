class RemoveBranchForeignKeyFromEmployees < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :employees, :branches
    remove_index :employees, :branch_id
  end
end
