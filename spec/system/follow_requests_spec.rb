require 'rails_helper'

RSpec.describe 'FollowRequests', type: :system do
  before do
    driven_by(:rack_test)
  end

  context "when current user click Follow button in a unfollowed user's profile" do
    it 'will create'
  end
end