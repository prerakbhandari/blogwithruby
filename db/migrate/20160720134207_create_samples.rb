class CreateSamples < ActiveRecord::Migration[5.0]
  def change
    create_table :samples do |t|
      t.text :Title
      t.text :Initial
      t.text :Surname
      t.text :Email
      t.text :Mobile

      t.timestamps
    end
  end
end
