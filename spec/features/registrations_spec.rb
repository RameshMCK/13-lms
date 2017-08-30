require 'rails_helper'

RSpec.feature "Registrations", type: :feature do
 context 'authenticated' do
    before(:each) do
      visit '/users/sign_in'
      fill_in 'user[email]', with: 'ram@aol.com'
      fill_in 'user[password]', with: 'abc123'
      click_button 'Log in'
    end


    scenario 'Create a registration' do
      visit '/registrations/new'
      
      select 'ram@aol.com', from: 'registration[user_id]'
      select 'Fall', from: 'registration[semester]'
      select 'Advanced Computer Science', from: 'registration[course_id]' # when model is used we need to use model[field name]
      
      fill_in 'registration[year]', with: '2017'
      fill_in 'registration[capacity]', with: '22'

      click_button 'Save'
      expect(page).to have_text('Calculus III1')
    end
    

  end
end

