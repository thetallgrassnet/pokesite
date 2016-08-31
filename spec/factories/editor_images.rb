FactoryGirl.define do
  factory :editor_image do
    editor_image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'assets', 'featured_image.png'), 'image/png') }
  end
end
