class EditorImage < ApplicationRecord
  has_paper_trail

  mount_uploader :editor_image, EditorImageUploader

  validates :editor_image, presence: true

  def as_json(options = nil)
    {
      file: editor_image.as_json(options)
    }
  end
end
