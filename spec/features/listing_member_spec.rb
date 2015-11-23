require 'rails_helper'

RSpec.feature "Listing Users" do

	before do
		@amala = User.create(first_name: "Amala",last_name: "Nivas", email: "amalarails@gmail.com",password:"123456789")
		@amu = User.create(first_name: "Naga",last_name: "Amala", email: "amala.b@gmail.com",password:"123456789")
	end

	scenario "shows a list of registered members" do
		visit "/"
		expect(page).to have_content("List of Members")
		expect(page).to have_content(@amala.full_name)
		expect(page).to have_content(@amu.full_name)
	end
end

