require 'rails_helper'

RSpec.describe EditorImage, type: :model do
  subject { FactoryGirl.build(:editor_image) }

  describe '#editor_image' do
    context 'when present' do
      it { is_expected.to be_valid }
    end

    context 'when missing' do
      before { subject.assign_attributes(editor_image: nil) }
      it     { is_expected.not_to be_valid }
    end
  end
end
