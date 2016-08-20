require 'rails_helper'

RSpec.describe Article::Post, type: :model do
  describe '.published' do
    let!(:published_post)   { FactoryGirl.create(:article_post, :published) }
    let!(:future_post)      { FactoryGirl.create(:article_post, :future_published) }
    let!(:unpublished_post) { FactoryGirl.create(:article_post) }

    subject { Article::Post.published }

    it { is_expected.to     include(published_post) }
    it { is_expected.to_not include(future_post, unpublished_post) }
  end

  describe '.featured' do
    let!(:featured_post)             { FactoryGirl.create(:article_post, :published, :featured) }
    let!(:future_featured_post)      { FactoryGirl.create(:article_post, :future_published, :featured) }
    let!(:unpublished_featured_post) { FactoryGirl.create(:article_post, :featured) }
    let!(:unfeatured_post)           { FactoryGirl.create(:article_post, :published) }

    subject { Article::Post.featured }

    it { is_expected.to     include(featured_post) }
    it { is_expected.to_not include(future_featured_post, unpublished_featured_post, unfeatured_post) }
  end

  describe '#headline' do
    subject { FactoryGirl.build(:article_post) }

    context 'when present and unique' do
      it { is_expected.to be_valid }
    end

    context 'when missing' do
      before { subject.assign_attributes(headline: nil) }
      it     { is_expected.to_not be_valid }
    end

    context 'when not unique' do
      let!(:post) { FactoryGirl.create(:article_post) }
      before      { subject.assign_attributes(headline: post.headline) }
      it          { is_expected.to_not be_valid }
    end
  end

  describe '#subhead' do
    subject { FactoryGirl.build(:article_post) }

    context 'when present' do
      it { is_expected.to be_valid }
    end

    context 'when missing' do
      before { subject.assign_attributes(subhead: nil) }
      it     { is_expected.to_not be_valid }
    end
  end

  describe '#body' do
    subject { FactoryGirl.build(:article_post) }

    context 'when present' do
      it { is_expected.to be_valid }
    end

    context 'when missing' do
      before { subject.assign_attributes(body: nil) }
      it     { is_expected.to_not be_valid }
    end
  end

  describe '#column' do
    subject { FactoryGirl.build(:article_post) }

    context 'when present' do
      it { is_expected.to be_valid }
    end

    context 'when missing' do
      before { subject.assign_attributes(column: nil) }
      it     { is_expected.to_not be_valid }
    end
  end

  describe '#author' do
    subject { FactoryGirl.build(:article_post) }

    context 'when present' do
      it { is_expected.to be_valid }
    end

    context 'when missing' do
      before { subject.assign_attributes(author: nil) }
      it     { is_expected.to_not be_valid }
    end
  end
end
