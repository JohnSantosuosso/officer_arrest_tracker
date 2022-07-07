class Officer < ApplicationRecord
  has_many :arrests

   validates_presence_of :name, :badge_number
   validates :under_investigation, inclusion: [false, true]

  def count_arrests
    arrests.count
  end
end