require 'spec_helper'

describe "Users" do
	before { @user = User.new(email: "testinghere@testing.com",
		      display_name: "Testing User")}
	subject { @user }

	it{should respond_to(:email)}
	it{should respond_to(:display_name)}
	it{should respond_to(:avatar)}

	it{should respond_to(:looks)}

	describe "when name is not present" do
		before {@user.email = ""}
		it {should_not be_valid}
	end

	describe "display_name" do 
		describe "is not present" do
			before {@user.display_name = ""}
			it {should_not be_valid}
		end

		describe "is longer than 30 characters" do
			before {@user.display_name = "a"*31}
			it {should_not be_valid}
		end
	end
end
