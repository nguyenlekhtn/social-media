require 'rails_helper'

RSpec.describe 'FollowRequests', type: :system do
  before do
    driven_by(:rack_test)
  end

  context 'when current user visit an unfollowing user with no pending request' do
    it 'has a follow button in the profile' do
      sign_in
    end
  end
end
