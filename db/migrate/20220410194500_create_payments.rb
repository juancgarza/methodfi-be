class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :amount_cents
      t.text :description
      t.references :checking_account, foreign_key: true, type: :string, null: false
      t.string :receiver_id, foreign_key: true, null: false

      t.timestamps
    end

    add_index :payments, :receiver_id
  end
end
