class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees, id: :string do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :phone_number

      t.timestamps
    end
  end
end
