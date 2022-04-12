class CreateBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :branches, id: :string do |t|

      t.timestamps
    end
  end
end
