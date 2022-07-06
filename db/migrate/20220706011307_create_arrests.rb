class CreateArrests < ActiveRecord::Migration[5.2]
  def change
    create_table :arrests do |t|
      t.string :name
      t.integer :age
      t.string :charge_description
      t.boolean :firearm

      t.timestamps
    end
  end
end
