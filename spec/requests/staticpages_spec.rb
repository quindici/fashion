require 'spec_helper'

describe "Static pages" do
  describe "Homepage" do
    it "should content Welcome!" do
      visit( '/' )
      expect(page).to have_content("Welcome!")
    end
  end
end
