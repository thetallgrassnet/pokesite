require 'rails_helper'

RSpec.describe Article::Column, type: :model do
  describe '#name' do
    subject { FactoryGirl.build(:article_column) }

    context 'when present and unique' do
      it { is_expected.to be_valid }
    end

    context 'when missing' do
      before { subject.assign_attributes(name: nil) }
      it     { is_expected.to_not be_valid }
    end

    context 'when not unique' do
      let!(:column) { FactoryGirl.create(:article_column) }
      before        { subject.assign_attributes(name: column.name) }
      it            { is_expected.to_not be_valid }
    end
  end

  describe '#to_s' do
    let!(:column) { FactoryGirl.build(:article_column) }
    subject       { column.to_s }
    it            { is_expected.to eql(column.name) }
  end
end
