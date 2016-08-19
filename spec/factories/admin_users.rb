FactoryGirl.define do
  factory :admin_user do
    sequence(:name) { |n| "Admin User #{n}" }
    email { "#{name.parameterize}@thetallgrass.net" }
    password "P@55w0rd"
    password_confirmation "P@55w0rd"

    trait :superuser do
      superuser true
    end
  end
end
