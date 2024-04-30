require 'rails_helper'

RSpec.describe 'UserVisitsTestPages', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'sucessfully' do
    visit root_path
    expect(page).to have_css 'h1', text: 'Social Media'
  end
end
