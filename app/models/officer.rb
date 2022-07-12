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

  def self.arrest_sort
    Officer.all.sort_by(&:count_arrests).reverse
    #check order
    #use &:method_name when referencing existing model method
  end
  
end