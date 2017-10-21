require 'rails_helper'

RSpec.describe Article::PostPolicy do

  let(:object)       { FactoryBot.build(:article_post) }
  let(:author)       { object.author }
  let(:other_author) { FactoryBot.build(:admin_user, :author) }
  let(:user)         { FactoryBot.build(:admin_user) }
  let(:superuser)    { FactoryBot.build(:admin_user, :superuser) }

  subject { described_class }

  permissions :create? do
    it { is_expected.to permit(author, object) }
    it { is_expected.to permit(superuser, object) }
    it { is_expected.not_to permit(other_author, object) }
    it { is_expected.not_to permit(user, object) }
  end

  permissions :update? do
    it { is_expected.to permit(author, object) }
    it { is_expected.to permit(superuser, object) }
    it { is_expected.not_to permit(other_author, object) }
    it { is_expected.not_to permit(user, object) }
  end

  permissions :destroy? do
    it { is_expected.to permit(author, object) }
    it { is_expected.to permit(superuser, object) }
    it { is_expected.not_to permit(other_author, object) }
    it { is_expected.not_to permit(user, object) }
  end
end
