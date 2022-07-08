require 'rails_helper'

RSpec.describe Arrest, type: :model do
  describe "relationships" do
    it {should belong_to :officer}
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :charge_description}
    it {should allow_value(false).for(:firearm)}
    it {should allow_value(true).for(:firearm)}
  end
end