require 'rails_helper'

describe Article::PostDecorator do
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
end
