require 'rails_helper'

RSpec.describe 'Logins', type: :system do
  before do
    driven_by(:rack_test)
  end

  context 'when go to test page and sign in sucessfully' do
    it 'displays testit' do
      visit '/test'
      fill_in 'Email', with: 'user1@example.com'
      fill_in 'Password', with: 'nopass'

      click_on 'Sign in'

      expect(page).to have_content 'testit'
    end
  end
end
