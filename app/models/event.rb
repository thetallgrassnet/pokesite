class Event < ApplicationRecord
  extend FriendlyId

  enum event_type: [:competition, :distribution]

  friendly_id :name, use: [:slugged, :history, :reserved]

  has_paper_trail

  mount_uploader :featured_image, FeaturedImageUploader

  scope :upcoming, -> { where('start_date > ?', Date.today) }
  scope :active,   -> { where('start_date <= ? and end_date >= ?', Date.today, Date.today) }
  scope :ended,    -> { where('end_date < ?', Date.today) }

  validates :name, presence: true, uniqueness: true
  validates :featured_image, presence: true

  def to_s
    name
  end
end
