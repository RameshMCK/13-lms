# == Schema Information
#
# Table name: registrations
#
#  id         :integer          not null, primary key
#  semester   :string           not null
#  year       :integer          not null
#  capacity   :integer          not null
#  is_open    :boolean          default(FALSE)
#  course_id  :integer          not null
#  teacher_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Registration, type: :model do
   describe '.new' do
    it 'instantiates a Registration object' do
      c = Registration.new
      #  binding.pry
      expect(c.is_a?(Registration)).to be true
      #check if uses table has 6 columns
      expect(c.attributes.keys.count).to eql(6)
    end
  end
  
    context 'happy path' do
      it 'saves a course' do
        c = Course.new(name: 'Calculus III', subject: 'Math',  level: 203, credits: 5)
        c.save
        expect(c.id).to_not be_nil
        course_id  = c.id
        user_id = User.first.id
        #binding.pry
        r = Registration.new(course_id: course_id, user_id: user_id,  semester: 'Fall', year: 2017, capacity: 125)
        r.save
        #binding.pry
        expect(r.id).to_not be_nil
        expect(r.semester).to eql('Fall') 
        #duplicate check
      #begin 
            # c1 = Registration.new(name: 'Calculus III', subject: 'Math',  level: 203, credits: 5)
            # c1.save
            # expect(c1.id).to be_nil
            # c1 = User.new(email: 'bob3@aol.com', password: 'abc123', role: 'teacher')
            # c1.save
            # expect(c1.id).to be_nil
        #rescue
        #    binding.pry
        #end
        end
      end
end
