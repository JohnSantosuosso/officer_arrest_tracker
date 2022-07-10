class Arrest < ApplicationRecord
  belongs_to :officer

   validates_presence_of :name, :age, :charge_description
   validates :firearm, inclusion: [false, true]

  def self.has_firearm
    Arrest.where(firearm: true)
  end

  def self.alpha_ordered
    order(:name)
  end

  def self.age_threshold(entered_age)
    Arrest.where("age > ?", entered_age)
  end
end