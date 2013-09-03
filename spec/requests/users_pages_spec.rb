require 'spec_helper'

describe "User authentication pages (Devise related)" do
	subject {page}
	describe "Signup Page" do
		before { visit new_user_registration_path }

		it {should have_content('Sign up')}
	end
end