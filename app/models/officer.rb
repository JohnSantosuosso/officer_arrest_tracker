class Officer < ApplicationRecord
  has_many :arrests

  def count_arrests
    arrests.count
  end
end