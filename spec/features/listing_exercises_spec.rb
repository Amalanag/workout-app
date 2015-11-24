require 'rails_helper'

RSpec.feature "Listing of Workouts" do
	before do
		@amala = User.create(first_name:"Amala",last_name:"Nivas",email:"bondadaamala@gmail.com",password:"123456789")
		@amu = User.create(first_name:"Naga",last_name:"Amala",email:"amala.b@gmail.com",password:"123456789")
		login_as(@amala)
		@e1 = @amala.exercises.create(duration_in_min: 20,workout: "Body building routine", workout_date: Date.today)
		@e2 = @amala.exercises.create(duration_in_min: 20,workout: "cardio", workout_date: Date.today)
		@following = Friendship.create(user: @amala, friend: @amu)
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
	scenario "shows a list of users friends" do
		visit "/"

		click_link "My Lounge"
		expect(page).to have_content("My Friends")
		expect(page).to have_link(@amu.full_name)
		expect(page).to have_link("Unfollow")
	end
end






