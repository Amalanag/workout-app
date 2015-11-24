require 'rails_helper'
RSpec.feature "Unfollow Friend" do
	before do
		@amala = User.create(first_name:"Amala",last_name:"Nivas",email:"bondadaamala@gmail.com",password:"123456789")
		@amu = User.create(first_name:"Naga",last_name:"Amala",email:"naga.dasari@hbo.com",password:"123456789")
		login_as(@amala)

		@following = Friendship.create(user: @amala, friend: @amu)
	end
	scenario do
		visit "/"
		click_link "My Lounge"
		link = "a[href='/friendships/#{@following.id}'][data-method='delete']"
		find(link).click

		expect(page).to have_content(@amu.full_name + " unfollowed")
	end
end
