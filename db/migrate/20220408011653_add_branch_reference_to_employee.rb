class AddBranchReferenceToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :branch, null: false, foreign_key: true, type: :string
  end
end
