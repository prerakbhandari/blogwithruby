class CreateSampleErrors < ActiveRecord::Migration[5.0]
  def change
    create_table :sample_errors do |t|
      t.text :Title
      t.text :Initial
      t.text :Surname
      t.text :Email
      t.text :Mobile
      t.text :Error

      t.timestamps
    end
  end
end
