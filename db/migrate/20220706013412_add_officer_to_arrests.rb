class AddOfficerToArrests < ActiveRecord::Migration[5.2]
  def change
    add_reference :arrests, :officer, foreign_key: true
  end
end
