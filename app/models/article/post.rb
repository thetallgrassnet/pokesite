class Article::Post < ApplicationRecord
  extend FriendlyId

  attr_accessor :publish_now

  belongs_to :column
  belongs_to :author, class_name: 'AdminUser'

  friendly_id :headline, use: [:slugged, :history, :reserved]

  has_paper_trail

  mount_uploader :featured_image, FeaturedImageUploader

  paginates_per 10

  sir_trevor_content :body

  scope :published, -> { where('published_at < ?', Time.now).order('published_at DESC') }
  scope :featured,  -> { published.where(featured: true).limit(6) }

  before_save :publish_if_publish_now

  validates :headline, presence: true, uniqueness: true
  validates :subhead,  presence: true
  validates :body,     presence: true
  validates :column,   presence: true
  validates :author,   presence: true
  validates :featured_image, presence: true

  def to_s
    headline
  end

  def excerpt
    body.first_block_of_type(:text)
  end

  private

  def publish_if_publish_now
    self.published_at = Time.now if publish_now == '1'
  end
end
