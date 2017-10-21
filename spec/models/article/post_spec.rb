require 'rails_helper'

RSpec.describe Article::Post, type: :model do
  subject { FactoryBot.build(:article_post) }

  describe '.published' do
    let!(:published_post)   { FactoryBot.create(:article_post, :published) }
    let!(:future_post)      { FactoryBot.create(:article_post, :future_published) }
    let!(:unpublished_post) { FactoryBot.create(:article_post) }

    subject { Article::Post.published }

    it { is_expected.to     include(published_post) }
    it { is_expected.not_to include(future_post, unpublished_post) }
  end

  describe '.featured' do
    let!(:featured_post)             { FactoryBot.create(:article_post, :published, :featured) }
    let!(:future_featured_post)      { FactoryBot.create(:article_post, :future_published, :featured) }
    let!(:unpublished_featured_post) { FactoryBot.create(:article_post, :featured) }
    let!(:unfeatured_post)           { FactoryBot.create(:article_post, :published) }

    subject { Article::Post.featured }

    it { is_expected.to     include(featured_post) }
    it { is_expected.not_to include(future_featured_post, unpublished_featured_post, unfeatured_post) }
  end

  describe '#headline' do
    context 'when present and unique' do
      it { is_expected.to be_valid }
    end

    context 'when missing' do
      before { subject.assign_attributes(headline: nil) }
      it     { is_expected.not_to be_valid }
    end

    context 'when not unique' do
      let!(:post) { FactoryBot.create(:article_post) }
      before      { subject.assign_attributes(headline: post.headline) }
      it          { is_expected.not_to be_valid }
    end
  end

  describe '#subhead' do
    context 'when present' do
      it { is_expected.to be_valid }
    end

    context 'when missing' do
      before { subject.assign_attributes(subhead: nil) }
      it     { is_expected.not_to be_valid }
    end
  end

  describe '#body' do
    context 'when present' do
      it { is_expected.to be_valid }
    end

    context 'when missing' do
      before { subject.assign_attributes(body: nil) }
      it     { is_expected.not_to be_valid }
    end
  end

  describe '#column' do
    context 'when present' do
      it { is_expected.to be_valid }
    end

    context 'when missing' do
      before { subject.assign_attributes(column: nil) }
      it     { is_expected.not_to be_valid }
    end
  end

  describe '#author' do
    context 'when present' do
      it { is_expected.to be_valid }
    end

    context 'when missing' do
      before { subject.assign_attributes(author: nil) }
      it     { is_expected.not_to be_valid }
    end
  end

  describe '#featured_image' do
    context 'when present' do
      it { is_expected.to be_valid }
    end

    context 'when missing' do
      before { subject.assign_attributes(featured_image: nil) }
      it     { is_expected.not_to be_valid }
    end
  end

  describe '#to_s' do
    let(:post) { FactoryBot.build(:article_post) }
    subject    { post.to_s }
    it         { is_expected.to eql(post.headline) }
  end

  describe '#excerpt' do
    let(:post) { FactoryBot.build(:article_post) }
    subject    { post.excerpt }
    it         { is_expected.to be_a(SirTrevorRails::Blocks::TextBlock) }
  end
end
