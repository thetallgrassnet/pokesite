require 'rails_helper'

RSpec.describe FeaturedImageUploader do
  include CarrierWave::Test::Matchers

  let(:post)     { FactoryGirl.create(:article_post) }
  let(:image)    { Rails.root.join('spec', 'support', 'assets', 'featured_image.png') }
  let(:uploader) { FeaturedImageUploader.new(post) }

  before do
    FeaturedImageUploader.enable_processing = true
    File.open(image) { |f| uploader.store!(f) }
  end

  after do
    FeaturedImageUploader.enable_processing = false
    uploader.remove!
  end

  describe 'self' do
    subject { uploader }
    it      { is_expected.to have_dimensions(1280, 720) }
  end

  describe '#small' do
    subject { uploader.small }
    it      { is_expected.to have_dimensions(640, 360) }
  end

  describe '#thumb' do
    subject { uploader.thumb }
    it      { is_expected.to be_no_larger_than(200, 200) }
  end
end
