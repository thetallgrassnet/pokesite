require 'rails_helper'

RSpec.describe EditorImagePolicy do

  let(:object)    { FactoryBot.build(:editor_image) }
  let(:user)      { FactoryBot.build(:admin_user) }
  let(:superuser) { FactoryBot.build(:admin_user, :superuser) }

  subject { described_class }

  permissions :create? do
    it { is_expected.to permit(superuser, object) }
    it { is_expected.not_to permit(user, object) }
  end

  permissions :destroy? do
    it { is_expected.to permit(superuser, object) }
    it { is_expected.not_to permit(user, object) }
  end
end
