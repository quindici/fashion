require 'spec_helper'

describe Look do
  let(:user) { FactoryGirl.create(:user)}
  before do
  	# @look = Look.new(description: "Lorem ipsum", user_id: user.id)
  	@look = user.looks.build(description: "Lorem ipsum")
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
end
