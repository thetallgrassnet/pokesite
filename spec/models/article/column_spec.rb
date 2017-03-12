require 'rails_helper'

RSpec.describe Article::Column, type: :model do
  subject { FactoryGirl.build(:article_column) }

  describe '.with_published_posts' do
    let!(:column)           { FactoryGirl.create(:article_column) }
    let!(:empty_column)     { FactoryGirl.create(:article_column) }
    let!(:published_post)   { FactoryGirl.create(:article_post, :published, column: column) }
    let!(:future_post)      { FactoryGirl.create(:article_post, :future_published, column: empty_column) }
    let!(:unpublished_post) { FactoryGirl.create(:article_post, column: empty_column) }

    subject { Article::Column.with_published_posts }

    it { is_expected.to     include(column) }
    it { is_expected.not_to include(empty_column) }
  end

  describe '#name' do
    context 'when present and unique' do
      it { is_expected.to be_valid }
    end

    context 'when missing' do
      before { subject.assign_attributes(name: nil) }
      it     { is_expected.not_to be_valid }
    end

    context 'when not unique' do
      let!(:column) { FactoryGirl.create(:article_column) }
      before        { subject.assign_attributes(name: column.name) }
      it            { is_expected.not_to be_valid }
    end
  end

  describe '#to_s' do
    let!(:column) { FactoryGirl.build(:article_column) }
    subject       { column.to_s }
    it            { is_expected.to eql(column.name) }
  end
end
