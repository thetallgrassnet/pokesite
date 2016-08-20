FactoryGirl.define do
  factory :article_post, class: 'Article::Post' do
    sequence(:headline) { |n| "Article #{n}" }
    subhead { headline }
    body { "This is #{headline}" }
    column { create(:article_column) }
    author { create(:admin_user) }

    trait :published do
      published_at (1..10).to_a.sample.days.ago
    end

    trait :future_published do
      published_at (1..10).to_a.sample.days.from_now
    end

    trait :featured do
      featured true
    end
  end
end
