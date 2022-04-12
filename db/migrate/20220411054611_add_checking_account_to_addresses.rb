class AddCheckingAccountToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_reference :addresses, :checking_account, foreign_key: true, type: :string
  end
end
