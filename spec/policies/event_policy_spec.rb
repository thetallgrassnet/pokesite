require 'rails_helper'

RSpec.describe EventPolicy do
  let(:object)    { FactoryBot.build(:event) }
  let(:user)      { FactoryBot.build(:admin_user) }
  let(:superuser) { FactoryBot.build(:admin_user, :superuser) }

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
    it { is_expected.not_to permit(user, object) }
  end
end
