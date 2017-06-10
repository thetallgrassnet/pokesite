require 'rails_helper'

RSpec.describe EditorImageUploader do
  include CarrierWave::Test::Matchers

  let(:editor_image) { FactoryGirl.create(:editor_image) }
  let(:uploader)     { editor_image.editor_image }

  before do
    EditorImageUploader.enable_processing = true
  end

  after do
    EditorImageUploader.enable_processing = false
  end

  describe '#large' do
    subject { uploader.large }
    it      { is_expected.to be_no_wider_than(850) }
  end

  describe '#medium' do
    subject { uploader.medium }
    it      { is_expected.to be_no_wider_than(640) }
  end

  describe '#small' do
    subject { uploader.small }
    it      { is_expected.to be_no_wider_than(320) }
  end

  describe '#thumb' do
    subject { uploader.thumb }
    it      { is_expected.to be_no_larger_than(200, 200) }
  end
end
