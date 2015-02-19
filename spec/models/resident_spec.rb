require 'rails_helper'

RSpec.describe Resident, type: :model do
  context "moving to a new unit" do
    before(:each) do
      @mover = Fabricate :resident
      @younger_candidate = Fabricate :resident, birthdate: @mover.birthdate - 3.years
      @youngest_candidate = Fabricate :resident, birthdate: @mover.birthdate - 6.years
    end
    
    it 'recognizes when a younger roommate is old enough' do
      expect(@mover.within_age_tolerance?(@younger_candidate)).to be(true)
    end
  
    it 'recognizes when a candidate is too young' do
      expect(@mover.within_age_tolerance?(@youngest_candidate)).to be(false)
    end
    
    it 'recognizes when a very young candidate is within an expanded range' do
      expect(@mover.within_age_tolerance?(@youngest_candidate, 10)).to be(true)
    end
  end
end
