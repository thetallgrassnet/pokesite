class CreateEditorImages < ActiveRecord::Migration[5.0]
  def change
    create_table :editor_images do |t|
      t.string :editor_image
    end
  end
end
