FactoryGirl.define do
  factory :admin_user do
    sequence(:email) { |n| "admin_user_#{n}@thetallgrass.net" }
    password "P@55w0rd"
    password_confirmation "P@55w0rd"

    trait :superuser do
      superuser true
    end
  end
end
