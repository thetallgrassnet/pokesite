class AdminUser < ApplicationRecord
  extend FriendlyId

  has_and_belongs_to_many :article_columns, class_name: 'Article::Column'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  friendly_id :name, use: [:slugged, :history, :reserved]

  has_paper_trail

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end
end
