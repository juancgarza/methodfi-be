class CreateCheckingAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :checking_accounts, id: :string do |t|
      t.string :aba_routing
      t.string :account_number
      t.string :ein
      t.belongs_to :account, null: false, foreign_key: true, type: :string

      t.timestamps
    end
  end
end
