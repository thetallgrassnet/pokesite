FactoryBot.define do
  factory :article_post, class: 'Article::Post' do
    sequence(:headline) { |n| "Article #{n}" }
    subhead { headline }
    body { {"data":[{"type":"text","data":{"text":"<p>This is some body content.</p>","format":"html"}},{"type":"text","data":{"text":"<p>This is some body content.</p>","format":"html"}}]}.to_json }
    column { create(:article_column) }
    author { create(:admin_user, article_columns: [column]) }
    featured_image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'assets', 'featured_image.png'), 'image/png') }

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
