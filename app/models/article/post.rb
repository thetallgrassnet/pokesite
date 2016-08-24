class Article::Post < ApplicationRecord
  extend FriendlyId

  attr_accessor :publish_now

  belongs_to :column
  belongs_to :author, class_name: 'AdminUser'

  friendly_id :headline, use: [:slugged, :history, :reserved]

  scope :published, -> { where('published_at < ?', Time.now) }
  scope :featured,  -> { published.where(featured: true) }

  before_save :publish_if_publish_now

  validates :headline, presence: true, uniqueness: true
  validates :subhead,  presence: true
  validates :body,     presence: true
  validates :column,   presence: true
  validates :author,   presence: true

  def to_s
    headline
  end

  private

  def publish_if_publish_now
    self.published_at = Time.now if publish_now == '1'
  end
end