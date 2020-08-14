require 'spec_helper'
 
describe Person do
    before :each do
        @person = Person.new("1", "mengru", "han", "ru.han@oa.com", "Female")   
    end


    
    it "returns the correct full_name" do
        # @person = Person.new("1", "mengru", "han", "ru.han@oa.com", "Female")
        expect(@person.full_name).to eql "mengruhan"
        # @person.full_name.should eql "mengru han"
    end

end
