class Arrest < ApplicationRecord
  belongs_to :officer

   validates_presence_of :name, :age, :charge_description
   validates :firearm, inclusion: [false, true]
end