class CreateOfficers < ActiveRecord::Migration[5.2]
  def change
    create_table :officers do |t|
      t.string :name
      t.integer :badge_number
      t.boolean :under_investigation

      t.timestamps
    end
  end
end
