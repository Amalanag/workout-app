require 'rails_helper'

RSpec.feature "Users Signup" do

	scenario "with valid credentials" do
		visit "/"

		click_link "Sign up"
		fill_in "First name", with:"Amala"
		fill_in "Last name", with:"Nivas"
		fill_in "Email", with: "user@example.com"
		fill_in "Password",with: "password"
		fill_in "Password confirmation",with: "password"
		click_button "Sign up"
    expect(page).to have_content("You have signed up successfully")
		visit "/"
		expect(page).to have_content("Amala Nivas")
	end
	scenario "with invalid credentials" do
		visit "/"

		click_link "Sign up"
		fill_in "First name", with:""
		fill_in "Last name", with:""
		fill_in "Email", with: "user@example.com"
		fill_in "Password",with: "password"
		fill_in "Password confirmation",with: "password"
		click_button "Sign up"
		expect(page).to have_content("First name can't b blank")
		expect(page).to have_content("Last name can't b blank")
		visit "/"
		expect(page).to have_content("Amala Nivas")
	end
end
