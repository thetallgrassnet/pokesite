require 'rails_helper'

describe Article::PostDecorator do
  include CarrierWave::Test::Matchers

  let(:post) { FactoryGirl.build(:article_post).extend Article::PostDecorator }
  subject    { post }
  it         { is_expected.to be_an(Article::Post) }

  describe '.content' do
    subject { post.content }

    context 'show' do
      before { post.expects(:action_name).returns('show') }

      it { is_expected.to be_an(Array) }
    end

    context 'index' do
      before { post.expects(:action_name).returns('index') }

      it { is_expected.to be_a(SirTrevorRails::Blocks::TextBlock) }
    end
  end

  describe '.display_featured_image' do
    before { Article::Post::FeaturedImageUploader.enable_processing = true }
    after  { Article::Post::FeaturedImageUploader.enable_processing = false }

    subject { post.display_featured_image }

    context 'show' do
      before { post.expects(:action_name).returns('show') }

      it { is_expected.to have_dimensions(1280, 720) }
    end

    context 'index' do
      before { post.expects(:action_name).returns('index') }

      it { is_expected.to have_dimensions(100, 56) }
    end
  end
end
