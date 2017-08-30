require 'rails_helper'

RSpec.feature "Users", type: :feature do
    context 'authenticated' do
    before(:each) do
      visit '/users/sign_in'
      fill_in 'user[email]', with: 'sue@aol.com'
      fill_in 'user[password]', with: 'abc123'
      click_button 'Log in'
    end

    scenario 'view list of users' do
      visit '/users'
      #expect(page).to have_text('bob@aol.com')
      expect(page).to have_text('sue@aol.com')
      expect(page).to have_text('student')
      expect(page).to have_text('teacher')
    end

    # scenario 'change role from student to teacher' do
    #   visit '/users/edit_role'
    #   fill_in 'email', with: 'bob@aol.com'
    #   select 'teacher', from: 'role'
    #   click_button 'Save'
    #   expect(page).to_not have_text('student')
    # end
  end
end
