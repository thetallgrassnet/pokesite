class Article::Column < ApplicationRecord
  extend FriendlyId

  has_and_belongs_to_many :authors, class_name: 'AdminUser'
  has_many :posts

  friendly_id :name, use: [:slugged, :history, :reserved]

  validates :name,        presence: true, uniqueness: true
  validates :description, presence: true

  def to_s
    name
  end
end
