class CreateXmlFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :xml_files do |t|
      t.text :data
      t.string :file_name

      t.timestamps
    end
  end
end
