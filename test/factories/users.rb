FactoryGirl.define do 
  
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com"}
    password "Pass1234"
    password_confirmation { |u| u.password } 
    
    trait :admin do
      is_admin true
      sequence(:email) {|n| "admin#{n}@example.com"}    
    end
  end
end