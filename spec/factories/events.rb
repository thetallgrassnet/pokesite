FactoryGirl.define do
  factory :event do
    name "MyString"
    featured_image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'assets', 'featured_image.png'), 'image/png') }
    event_type 1
    start_date "2017-06-23"
    end_date "2017-06-23"
    location "MyString"
    notes "MyText"
  end
end
