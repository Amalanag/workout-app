require 'rails_helper'

RSpec.feature "Following Friends" do
	before do
		@amala = User.create(first_name: "Amala",last_name: "Nivas",email:"amalarails@gmail.com",password:"123456789")
	  @amu = User.create(first_name: "Naga",last_name: "Amala",email:"amala.b@gmail.com",password:"123456789")
		login_as(@amala)
	end

	scenario "if signed in succeeds" do
	visit "/"

		expect(page).to have_content(@amala.full_name)
		expect(page).to have_content(@amu.full_name)
		expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@amala.id}")

		link = "a[href='/friendships?friend_id=#{@amu.id}']"
		find(link).click

		expect(page).not_to have_link("Follow", :href =>"/friendships?friend_id=#{@amu.id}")
	end
end