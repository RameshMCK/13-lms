require 'rails_helper'

RSpec.feature "Courses", type: :feature do
   context 'authenticated' do
    before(:each) do
      visit '/users/sign_in'
      fill_in 'user[email]', with: 'sue@aol.com'
      fill_in 'user[password]', with: 'abc123'
      click_button 'Log in'
    end


    scenario 'Create a courses' do
      visit '/courses/new'
      fill_in 'course[name]', with: 'Advanced Computer Science'
      fill_in 'course[subject]', with: 'Computer Science'
      fill_in 'course[level]', with: '200'
      fill_in 'course[credits]', with: '3'
      
      click_button 'Save'
      expect(page).to have_text('Advanced Computer Science')
    end
    

  end
end
