require 'rails_helper'

RSpec.describe AdminUserPolicy do

  let(:object)    { FactoryGirl.build(:admin_user) }
  let(:user)      { FactoryGirl.build(:admin_user) }
  let(:superuser) { FactoryGirl.build(:admin_user, :superuser) }

  subject { described_class }

  permissions :create? do
    it { is_expected.to permit(superuser, object) }
    it { is_expected.not_to permit(user, object) }
  end

  permissions :update? do
    it { is_expected.to permit(superuser, object) }
    it { is_expected.not_to permit(user, object) }
  end

  permissions :destroy? do
    it { is_expected.to permit(superuser, object) }
    it { is_expected.not_to permit(superuser, superuser) }
    it { is_expected.not_to permit(user, object) }
  end

  permissions :destroy_all? do
    it { is_expected.not_to permit(user) }
    it { is_expected.not_to permit(superuser) }
  end
end
