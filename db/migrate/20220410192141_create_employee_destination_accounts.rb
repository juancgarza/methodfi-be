class CreateEmployeeDestinationAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_destination_accounts, id: :string do |t|
      t.string :connection_id
      t.string :account_number
      t.string :type
      
      t.timestamps
    end

  end
end
