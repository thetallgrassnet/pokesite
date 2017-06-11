FactoryGirl.define do
  factory :admin_user do
    sequence(:name) { |n| "Admin User #{n}" }
    email { "#{name.parameterize}@thetallgrass.net" }
    password "P@55w0rd"

    trait :superuser do
      superuser true
    end

    trait :author do
      article_columns { create_list(:article_column, 1) }
    end
  end
end
