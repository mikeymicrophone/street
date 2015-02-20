require 'rails_helper'

RSpec.describe Resident, type: :model do
  context "visiting friends" do
    it 'can know available friends within set biking range when alone in town' do
      @occupancy = Fabricate :occupancy
      expect(@occupancy.resident.potential_friends).to be(0)
    end
  end
  
  context "moving to a new unit" do
    
    context "can find open units" do
      
      it 'cant move without vacancy' do
        @mover = Fabricate :resident
        @unit = Fabricate :unit
        Unit.stub(:all => [@unit]) 
        @unit.stub(:has_vacancy? => false) 
        @mover.move!
      end
      
    end
    
    context "all roomates are within appropriate age range" do
      before(:each) do
        @mover = Fabricate :resident
        @younger_candidate = Fabricate :resident, birthdate: @mover.birthdate - 3.years
        @youngest_candidate = Fabricate :resident, birthdate: @mover.birthdate - 6.years
        @oldest_candidate = Fabricate :resident, birthdate: @mover.birthdate + 6.years
      end
    
      it 'recognizes when a younger roommate is old enough' do
        expect(@mover.within_age_tolerance?(@younger_candidate)).to be(true)
      end
  
      it 'recognizes when a candidate is too young' do
        expect(@mover.within_age_tolerance?(@youngest_candidate)).to be(false)
      end
    
      it 'recognizes when a candidate is too old' do
        expect(@mover.within_age_tolerance?(@oldest_candidate)).to be(false)
      end
    
      it 'recognizes when a very young candidate is within an expanded range' do
        expect(@mover.within_age_tolerance?(@youngest_candidate, 10)).to be(true)
      end
    end
  end
end
