class Officer < ApplicationRecord
  has_many :arrests, dependent: :destroy

   validates_presence_of :name, :badge_number
   validates :under_investigation, inclusion: [false, true]

  def count_arrests
    arrests.count
  end

  def self.created_at_desc
    order(created_at: :desc)
  end
  
end