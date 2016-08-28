require 'rails_helper'

class TestImageUploader < CarrierWave::Uploader::Base
  include ImageUploader
end

describe TestImageUploader do
  include CarrierWave::Test::Matchers

  let(:post)     { FactoryGirl.create(:article_post) }
  let(:image)    { Rails.root.join('spec', 'support', 'assets', 'featured_image.png') }
  let(:uploader) { TestImageUploader.new(post) }

  context 'with a non-image' do
    subject { uploader.store!(Rack::Test::UploadedFile.new(image, 'text/plain')) }
    it      { expect { subject }.to raise_error CarrierWave::IntegrityError }
  end

  context 'with an image' do
    before do
      TestImageUploader.enable_processing = true
      File.open(image) { |f| uploader.store!(f) }
    end

    after do
      TestImageUploader.enable_processing = false
      uploader.remove!
    end

    context 'default' do
      subject { uploader }
      it      { is_expected.to be_format('jpeg') }
    end

    context 'thumb' do
      subject { uploader.thumb }
      it      { is_expected.to be_no_larger_than(100, 100) }
    end
  end
end
