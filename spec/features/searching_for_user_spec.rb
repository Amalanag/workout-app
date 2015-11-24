require 'rails_helper'

RSpec.feature "Searching for User" do

	before do
		@amala = User.create(first_name: "Amala",last_name: "Nivas", email: "amalarails@gmail.com",password:"123456789")
		@amu = User.create(first_name: "Naga",last_name: "Amala", email: "naga.dasari@hbo.com",password:"123456789")
	end

	scenario "with existing name returns all those users" do
		visit "/"

		fill_in "search_name",with: "Amala"
		click_button "Search"

		expect(page).to have_content(@amala.full_name)
		expect(page).to have_content(@amu.full_name)
		expect(current_path).to eq("/dashboard/search")
	end
end
