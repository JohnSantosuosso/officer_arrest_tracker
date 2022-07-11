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

  describe 'instance methods' do
    describe '#has_firearm' do
      before :each do
        @officer_1 = Officer.create!(id: 1, name: "Zac Brown", badge_number: 23884, under_investigation: true)
        @arrest_1 = Arrest.create!(id: 1, name: "Ralph Waldo Emerson", age: 23, charge_description: "Alcohol", firearm: true, created_at:"2022-07-06 02:05:39 UTC", updated_at:"2022-07-06 02:05:39 UTC", officer_id: 1)
        @arrest_2 = Arrest.create!(id: 2, name: "Hamburglar", age: 25, charge_description: "Drug", firearm: false, created_at: "2022-07-06 02:05:39 UTC", updated_at:"2022-07-06 02:06:36 UTC", officer_id: 1)
      end
      
      it 'determines which arrests have a true value for firearm' do
          show_firearm_arrests = Arrest.has_firearm
          expect(show_firearm_arrests.to_a).to eql([@arrest_1])
      end
    end

      describe '#alpha orders arrests' do
      before :each do
        @officer_1 = Officer.create!(id: 1, name: "Zac Brown", badge_number: 23884, under_investigation: true)
        @arrest_1 = Arrest.create!(id: 1, name: "Ralph Waldo Emerson", age: 23, charge_description: "Alcohol", firearm: true, created_at:"2022-07-06 02:05:39 UTC", updated_at:"2022-07-06 02:05:39 UTC", officer_id: 1)
        @arrest_2 = Arrest.create!(id: 2, name: "Hamburglar", age: 25, charge_description: "Drug", firearm: false, created_at: "2022-07-06 02:05:39 UTC", updated_at:"2022-07-06 02:06:36 UTC", officer_id: 1)
      end
      
      it 'determines which arrests have a true value for firearm' do
          show_alpha_arrests = Arrest.alpha_ordered
          expect(show_alpha_arrests.to_a).to eql([@arrest_2, @arrest_1])
      end
    end
  end

end