require 'rails_helper'

RSpec.describe Officer, type: :model do
  describe "relationships" do
    it {should have_many :arrests}
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :badge_number}
    it {should allow_value(false).for(:under_investigation)}
    it {should allow_value(true).for(:under_investigation)}
  end

  describe 'instance methods' do
    describe '#count' do
      before :each do
        @officer_1 = Officer.create!(name:"John Jones", badge_number: 42323, under_investigation: true)
        @arrest_1 = @officer_1.arrests.create!(name: 'James Joyce', age: 32, charge_description: "Alcohol", firearm: true)
        @arrest_2 = @officer_1.arrests.create!(name: 'Andy Griffith', age: 52, charge_description: "Drug", firearm: true)
        @officer_2 = Officer.create!(name:"Mark Smith", badge_number: 23243, under_investigation: false)
      end
        it 'counts the number of arrests by officer' do
          expect(@officer_1.count_arrests).to eql(2)
          expect(@officer_2.count_arrests).to eql(0)
        end
    end
  end

end