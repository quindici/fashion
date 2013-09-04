require 'spec_helper'

describe "User authentication pages (Devise related)" do
	subject {page}
	
	describe "Signup Page" do

		before { visit new_user_registration_path }

		let(:submit) {"Sign up"}

		it {should have_content('Sign up')}
		it {should have_field('Email')}
		it {should have_field('Display name')}
		it {should have_field('Password')}
		it {should have_field('Password confirmation')}
		it {should have_field('user_avatar')} # How to test if it has file field?

		describe "when I fill in nothing" do
			it "should not create a user" do 
				expect {click_button submit}.not_to change(User, :count)
			end
		end

		describe "when I input wrong email format" do
			before do
				fill_in "Display name", with: "Test User"
				fill_in "Email", with: "Mess@messy"
				fill_in "Password", with: "password"
				fill_in "Password confirmation", with: "password"
				# Check if the file can be attached
				attach_file "user_avatar", "#{Rails.root}/spec/fixtures/avatar.jpg"
			end
			it "should not add a user" do
				expect {click_button submit}.not_to change(User, :count)
			end
		end

		describe "when I sign up with valid data" do
			before do
				fill_in "Display name", with: "Test User"
				fill_in "Email", with: "testinguser@testing.com"
				fill_in "Password", with: "password"
				fill_in "Password confirmation", with: "password"
			end
			it "should create a user" do
				expect {
					click_button submit
				}.to change(User, :count).by(1)
			end
		end

	end

	describe "Signin Page" do
		let(:user) { FactoryGirl.create(:user) }
		let(:submit_login) {"Sign in"}
		before { visit new_user_session_path }

		describe "when I sign in with correct email and password" do
			before do
				fill_in "Email", with: user.email
				fill_in "Password", with: user.password
				click_button submit_login
			end
			it "should log in" do
				expect(page).to have_content("Account")
				expect(page).to have_content("Logout")
			end
		end
	end

end