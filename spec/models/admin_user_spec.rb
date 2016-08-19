require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  describe '#name' do
    context 'when present and unique' do
      let!(:user) { FactoryGirl.build(:admin_user) }
      subject     { user }

      it { is_expected.to be_valid }
    end

    context 'when missing' do
      let!(:user) { FactoryGirl.build(:admin_user) }
      subject     { user }
      before      { subject.assign_attributes(name: nil) }

      it { is_expected.to_not be_valid }
    end

    context 'when not unique' do
      let!(:old_user) { FactoryGirl.create(:admin_user) }
      let!(:user)     { FactoryGirl.build(:admin_user) }
      subject         { user }
      before          { subject.assign_attributes(name: old_user.name) }

      it { is_expected.to_not be_valid }
    end
  end
end
