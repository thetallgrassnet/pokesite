require 'rails_helper'

describe Article::PostDecorator do
  let(:post) { FactoryGirl.build(:article_post).extend Article::PostDecorator }
  subject    { post }
  it         { is_expected.to be_an(Article::Post) }
end
