require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) { FactoryGirl.build(:event) }
  subject { event }

  describe '.upcoming' do
    before do
      event.save
      travel_to 1.day.before(event.start_date)
    end

    after { travel_back }

    subject { Event.upcoming }

    it { is_expected.to include(event) }
  end

  describe '.active' do
    before do
      event.save
      travel_to event.start_date
    end

    after { travel_back }

    subject { Event.active }

    it { is_expected.to include(event) }
  end

  describe '.ended' do
    before do
      event.save
      travel_to 1.day.after(event.end_date)
    end

    after { travel_back }

    subject { Event.ended }

    it { is_expected.to include(event) }
  end

  describe '#to_s' do
    subject { event.to_s }
    it      { is_expected.to eql(event.name) }
  end
end
