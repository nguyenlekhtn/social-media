require 'rails_helper'

RSpec.describe 'FollowRequests', type: :system do
  before do
    driven_by(:rack_test)
  end

  context 'when current user visits an unfamilar user' do
    let(:current_user) { create(:user) }
    let(:unfamilar_user) { create(:user) }

    it 'has a follow button in the profile' do
      sign_in current_user

      visit user_path(unfamilar_user)
      expect(page).to have_button('Follow')
    end
  end

  context 'when current user visits an user who received requests from him but not accepted yet' do
    let(:current_user) { create(:user) }
    let(:pending_user) { create(:user) }

    before do
      create(:request, requester: current_user, requested_user: pending_user)
    end

    it 'has a pending button in the profile that is disabled' do
      sign_in current_user

      visit user_path(pending_user)
      expect(page).to have_button('Pending', disabled: true)
    end
  end
end
