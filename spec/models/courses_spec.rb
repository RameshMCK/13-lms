require 'rails_helper'

RSpec.describe Course, type: :model do
#   describe '.new' do
    it 'instantiates a Course object' do
      c = Course.new
      #  binding.pry
      expect(c.is_a?(Course)).to be true
      #check if uses table has 7 columns
      expect(c.attributes.keys.count).to eql(7)
    end
  end
  
    context 'happy path' do
      it 'saves a course' do
        c = Course.new(name: 'Calculus III', subject: 'Math',  level: 203, credits: 5)
        c.save
        #binding.pry
        expect(c.id).to_not be_nil
        expect(c.name).to eql('Calculus III') 
        expect(c.level).to eql(203)
        expect(c.credits).to eql(5) 
    
        #duplicate check
       #begin 
            c1 = Course.new(name: 'Calculus III', subject: 'Math',  level: 203, credits: 5)
            c1.save
            expect(c1.id).to be_nil
            # c1 = User.new(email: 'bob3@aol.com', password: 'abc123', role: 'teacher')
            # c1.save
            # expect(c1.id).to be_nil
        #rescue
        #    binding.pry
        #end
      end


   #end
end
