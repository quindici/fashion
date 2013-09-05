require 'spec_helper'

describe Look do
  let(:user) { FactoryGirl.create(:user)}
  before do
  	# @look = Look.new(description: "Lorem ipsum", user_id: user.id)
  	@look = FactoryGirl.create(:look, user: user)

  end

  subject { @look }

  it {should respond_to(:description)}
  it {should respond_to(:user_id)}
  it {should respond_to(:lookPhotos)}

  its(:user) {should eq user}

  it {should be_valid}

  describe "when user_id is not present" do
  	before {@look.user_id = nil}
  	it {should_not be_valid}
  end

  describe "when look description is too long" do
    before {@look.description = "a"*141}
    it {should_not be_valid}
  end

  ## This test coding does not work. Need to fix the bug in the future.
  # Really don't understand why as the code is exactly the same!!
  describe "lookPhotos association" do
    before do 
      @look.save
      FactoryGirl.create(:lookPhoto, look: @look)
      FactoryGirl.create(:lookPhoto, look: @look)
    end
    it "when deleting a look, all related look photos should be deleted" do
      lps = @look.lookPhotos.to_a
      @look.destroy
      expect(lps).not_to be_empty
      lps.each do |lookPhoto|
        expect(LookPhoto.where(id: lps.id)).to be_empty
      end
    end
  end
  ## End of problematic codes
end
