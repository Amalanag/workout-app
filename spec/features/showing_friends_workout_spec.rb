require "rails_helper"
RSpec.feature "Showing Friend Workout" do
before do
@amala = User.create(first_name: "Amala", last_name: "Nivas", email: "amalarails@gmail.com", password: "123456789")
	@amu = User.create(first_name: "Naga", last_name: "Amala", email: "naga.dasari@hbo.com", password: "123456789")
@e1 = @amala.exercises.create(duration_in_min: 74, workout: "Weight lifting routine",
workout_date: Date.today)
@e2 = @amu.exercises.create(duration_in_min: 55, workout: "Naga's weight lifting routine",
workout_date: Date.today)
login_as(@amala)
@following = Friendship.create(user: @amala, friend: @amu)
end
scenario "shows friend's workout for last 7 days" do
visit "/"
click_link "My Lounge"
click_link @amu.full_name
expect(page).to have_content(@amu.full_name + "'s Exercises")
expect(page).to have_content(@e2.workout)
expect(page).to have_css("div#chart")
end
end