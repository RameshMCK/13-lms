# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :string           default("student")
#

require 'rails_helper'

RSpec.describe User, type: :model do
    describe '.new' do
    it 'instantiates a User object' do
      c = User.new
      #  binding.pry
      expect(c.is_a?(User)).to be true
      #check if uses table has 15 columns
      expect(c.attributes.keys.count).to eql(14)
    end
  end
  
    context 'happy path' do
      it 'saves a user' do
        c = User.new(email: 'bob3@aol.com', password: 'abc123', role: 'teacher')
        c.save
        #binding.pry
        expect(c.id).to_not be_nil
        expect(c.role).to eql('teacher') 
        
        c1 = User.new(email: 'bob3@aol.com', password: 'abc123', role: 'teacher')
        c1.save
        expect(c1.id).to be_nil
      end


end

end
