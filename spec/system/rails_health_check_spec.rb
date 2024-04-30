require 'rails_helper'

RSpec.describe 'RailsHealthCheck', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'sucessfully' do
    visit rails_health_check_path
    expect(page.status_code).to eq 200
  end
end
