require 'rails_helper'

RSpec.feature "Listing of Workouts" do
	before do
		@amala = User.create(email:"bondadaamala@gmail.com",password:"123456789")
		login_as(@amala)
		@e1 = @amala.exercises.create(duration_in_min: 20,workout: "Body building routine", workout_date: "2015-11-19")
		@e2 = @amala.exercises.create(duration_in_min: 20,workout: "cardio", workout_date: "2015-11-20")
	end
	scenario "shows user's workout for last 7 days" do
		visit "/"

		click_link "My Lounge"
		expect(page).to have_content(@e1.duration_in_min)
		expect(page).to have_content(@e1.workout)
		expect(page).to have_content(@e1.workout_date)
		expect(page).to have_content(@e2.duration_in_min)
		expect(page).to have_content(@e2.workout)
		expect(page).to have_content(@e2.workout_date)
	end
end