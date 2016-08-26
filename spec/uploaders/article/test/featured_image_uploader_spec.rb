require 'rails_helper'

describe Article::Post::FeaturedImageUploader do
  include CarrierWave::Test::Matchers

  let(:post)     { FactoryGirl.create(:article_post) }
  let(:image)    { Rails.root.join('spec', 'support', 'assets', 'featured_image.png') }
  let(:uploader) { Article::Post::FeaturedImageUploader.new(post) }

  before do
    Article::Post::FeaturedImageUploader.enable_processing = true
    File.open(image) { |f| uploader.store!(f) }
  end

  after do
    Article::Post::FeaturedImageUploader.enable_processing = false
    uploader.remove!
  end

  context 'default' do
    subject { uploader }
    it      { is_expected.to have_dimensions(1280, 720) }
  end

  context 'small' do
    subject { uploader.small }
    it      { is_expected.to have_dimensions(640, 360) }
  end
end
