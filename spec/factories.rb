FactoryGirl.define do
  factory :user do
    username "Pekka"
    password "foobar1"
    password_confirmation "foobar1"
  end

  factory :brewery do
    year 1900
    name 'anynomous'
  end

  factory :beer do
    brewery
    name "anynomous"
    style
  end

  factory :style do
  	sequence(:title) {|x|"style#{x}"}
  end

  factory :rating do
    score 10
  end

  factory :rating1, :class => Rating do
    score 10
  end

  factory :rating2, :class => Rating do
    score 20
  end
end
