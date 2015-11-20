require 'rails_helper'

RSpec.feature "Creating Exercise" do

	before do
		@amala = User.create!(email: "amalarails@gmail.com",password: "123456789")
		login_as(@amala)
	end

	scenario "with valid inputs" do
	 visit "/"
	click_link "My Lounge"
	click_link "New Workout"
	expect(page).to have_link("Back")

	fill_in "Duration",with: 70
	fill_in "Workout Details", with: "Weight lifting"
	fill_in "Activity date", with: "2015-12-21"
	click_button "Create Exercise"

	expect(page).to have_content("Exercise has been created")
	exercise = Exercise.last
	expect(page.current_path).to eq(user_exercise_path(@amala, exercise))
 end
end