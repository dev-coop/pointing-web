FactoryGirl.define do 
  
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com"}
    password "pass1234"
    password_confirmation "pass1234"
    
    trait :admin do
      is_admin true
      sequence(:email) {|n| "admin#{n}@example.com"}    
    end
  end
end