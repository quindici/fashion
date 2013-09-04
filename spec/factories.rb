FactoryGirl.define do
  # factory :user do
  #   display_name     	"Michael Hartl"
  #   email    			"michael@example.com"
  #   password 			"foobar"
  #   password_confirmation "foobar"
  # end

  factory :user do
    sequence(:display_name)   { |n| "Person #{n}" }
    sequence(:email)          { |n| "person_#{n}@testing.com"}
    password                  "testing1234"
    password_confirmation     "testing1234"
  end

  # factory :look do
  # 	user_id 			"5"
  # 	description    		"Lorem Blah Blah"
  # end

  factory :look do
    description       "Look - Lorem Blah Blah"
    user
  end

  factory :lookPhoto do
    description       "Look Photo - Lorem Blah Blah"
    look
  end

end