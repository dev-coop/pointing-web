FactoryGirl.define do
  factory :location do
    name "MyString"
    address "MyString"
    lat 1.5
    lng 1.5
    last_geocoded_at "2015-04-26"
    description "MyString"
    status "MyString"
    comments "MyText"
  end
end
