class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :line_1
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
