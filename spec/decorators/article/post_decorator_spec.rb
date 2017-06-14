require 'rails_helper'

RSpec.describe Article::PostDecorator do
  include CarrierWave::Test::Matchers

  let(:post) { FactoryGirl.build(:article_post).extend Article::PostDecorator }
  subject    { post }
  it         { is_expected.to be_an(Article::Post) }

  describe '#content' do
    subject { post.content }

    context 'when on posts#show' do
      before do
        stub_controller('posts')
        stub_action('show')
      end

      it { is_expected.to be_an(Array) }
    end

    context 'when on posts#index' do
      before do
        stub_controller('posts')
        stub_action('index')
      end

      it { is_expected.to be_a(SirTrevorRails::Blocks::TextBlock) }
    end

    context 'when on columns#show' do
      before do
        stub_controller('columns')
        stub_action('show')
      end

      it { is_expected.to be_a(SirTrevorRails::Blocks::TextBlock) }
    end
  end

  describe '#display_featured_image' do
    before { Article::Post::FeaturedImageUploader.enable_processing = true }
    after  { Article::Post::FeaturedImageUploader.enable_processing = false }

    subject { post.display_featured_image }

    context 'when on posts#show' do
      before do
        stub_controller('posts')
        stub_action('show')
      end

      it { is_expected.to have_dimensions(1280, 720) }
    end

    context 'when on posts#index' do
      before do
        stub_controller('posts')
        stub_action('index')
      end

      it { is_expected.to be_no_larger_than(200, 200) }
    end

    context 'when on columns#show' do
      before do
        stub_controller('columns')
        stub_action('show')
      end

      it { is_expected.to be_no_larger_than(200, 200) }
    end
  end

  def stub_action(action)
    post.stubs(:action_name).returns(action)
  end

  def stub_controller(controller)
    post.stubs(:controller_name).returns(controller)
  end
end
