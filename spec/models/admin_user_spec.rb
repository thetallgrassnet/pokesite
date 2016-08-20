require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  describe '#name' do
    subject { FactoryGirl.build(:admin_user) }

    context 'when present and unique' do
      it { is_expected.to be_valid }
    end

    context 'when missing' do
      before { subject.assign_attributes(name: nil) }
      it     { is_expected.to_not be_valid }
    end

    context 'when not unique' do
      let!(:user) { FactoryGirl.create(:admin_user) }
      before      { subject.assign_attributes(name: user.name) }
      it          { is_expected.to_not be_valid }
    end
  end

  describe '#to_s' do
    let!(:user) { FactoryGirl.build(:admin_user) }
    subject     { user.to_s }
    it          { is_expected.to eql(user.name) }
  end
end
