require 'spec_helper'

describe "Users" do
	before { @user = FactoryGirl.create(:user, email: "testinghere@testing.com",
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

	describe "look association" do
		before {@user.save }
		let!(:older_look) do
			FactoryGirl.create(:look, user: @user, created_at: 1.day.ago)
		end
		let!(:newer_look) do
			FactoryGirl.create(:look, user: @user, created_at: 1.hour.ago)
		end
		it "should have the right looks in the right order" do
			expect(@user.looks.to_a).to eq [newer_look, older_look]
		end

		it "when deleting a user, all related looks should be deleted" do
		    looks = @user.looks.to_a
		    @user.destroy
		    expect(looks).not_to be_empty
		    looks.each do |look|
		      expect(Look.where(id: look.id)).to be_empty
    		end
  		end
	end
end
