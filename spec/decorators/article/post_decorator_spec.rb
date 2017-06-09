require 'rails_helper'

RSpec.describe Article::PostDecorator do
  include CarrierWave::Test::Matchers

  let(:post) { FactoryGirl.build(:article_post).extend Article::PostDecorator }
  subject    { post }
  it         { is_expected.to be_an(Article::Post) }

  describe '#content' do
    subject { post.content }

    context 'when on show' do
      before { expect_action('show') }
      it     { is_expected.to be_an(Array) }
    end

    context 'when on index' do
      before { expect_action('index') }
      it     { is_expected.to be_a(SirTrevorRails::Blocks::TextBlock) }
    end
  end

  describe '#display_featured_image' do
    before { Article::Post::FeaturedImageUploader.enable_processing = true }
    after  { Article::Post::FeaturedImageUploader.enable_processing = false }

    subject { post.display_featured_image }

    context 'when on show' do
      before { expect_action('show') }
      it     { is_expected.to have_dimensions(1280, 720) }
    end

    context 'when on index' do
      before { expect_action('index') }
      it     { is_expected.to be_no_larger_than(200, 200) }
    end
  end

  def expect_action(action)
    post.expects(:action_name).returns(action)
  end
end
