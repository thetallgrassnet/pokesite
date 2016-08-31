class EditorImage < ApplicationRecord
  has_paper_trail

  mount_uploader :editor_image, EditorImageUploader

  validates :editor_image, presence: true

  def to_json
    editor_image.to_json
  end
end
