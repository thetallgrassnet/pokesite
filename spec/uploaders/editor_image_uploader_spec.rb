require 'rails_helper'

describe EditorImageUploader do
  include CarrierWave::Test::Matchers

  let(:image)    { Rails.root.join('spec', 'support', 'assets', 'featured_image.png') }
  let(:uploader) { EditorImageUploader.new }

  before do
    EditorImageUploader.enable_processing = true
    File.open(image) { |f| uploader.store!(f) }
  end

  after do
    EditorImageUploader.enable_processing = false
    uploader.remove!
  end

  describe '#store_dir' do
    subject { uploader.store_dir }
    it { is_expected.to eql "uploads/test/editor" }
  end

  describe '#thumb' do
    subject { uploader.thumb }
    it      { is_expected.to be_no_larger_than(100, 100) }
  end
end
