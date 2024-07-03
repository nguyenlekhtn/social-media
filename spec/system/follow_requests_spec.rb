require 'rails_helper'

RSpec.describe 'FollowRequests', type: :system do
  before do
    driven_by(:rack_test)
  end

  context 'when current user visit an unfamilar user' do
    let(:current_user) { create(:user) }
    let(:unfamilar_user) { create(:user) }

    it 'has a follow button in the profile' do
      sign_in current_user

      visit users_path(unfamilar_user)
      expect(page).to have_button('Follow')
    end
  end
end
