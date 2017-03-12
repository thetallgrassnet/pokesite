class Article::Column < ApplicationRecord
  extend FriendlyId

  has_and_belongs_to_many :authors, class_name: 'AdminUser'
  has_many :posts

  friendly_id :name, use: [:slugged, :history, :reserved]

  scope :with_published_posts, -> { joins(:posts).group('article_columns.id').merge(Article::Post.published).having('count(article_posts.id) > ?', 0) }

  validates :name,        presence: true, uniqueness: true
  validates :description, presence: true

  def to_s
    name
  end
end
