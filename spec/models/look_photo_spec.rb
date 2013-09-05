require 'spec_helper'

describe LookPhoto do
  let(:look) { FactoryGirl.create(:look)}
  before do
  	# @lookPhoto = LookPhoto.new(description: "Lorem ipsum", look_id: look.id)
  	@lookPhoto = look.lookPhotos.build(description: "Lorem ipsum")
  end

  subject { @lookPhoto }

  it {should respond_to(:description)}
  it {should respond_to(:look_id)}

  its(:look) {should eq look}


  it {should be_valid}

  describe "when look_id is not present" do
  	before {@lookPhoto.look_id = nil}
  	it {should_not be_valid}
  end

  describe "when lookPhoto's description is too long" do
    before {@lookPhoto.description = "a"*141}
    it {should_not be_valid}
  end
end