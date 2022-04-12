class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts, id: :string do |t|
      t.string :name
      t.string :dba

      t.timestamps
    end
  end
end
