require 'rails_helper'

RSpec.feature "Users Signup" do

	scenario "with valid credentials" do
		visit "/"

		click_link "Sign up"
		fill_in "Email", with: "user@example.com"
		fill_in "Password",with: "password"
		fill_in "Password confirmation",with: "password"
		click_button "Signup"

		expect(page).to have_content("You have Signed up successfully")
	end
end
