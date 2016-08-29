ActiveAdmin.register EditorImage do
  actions :all, except: [:new, :edit, :update]

  permit_params attachment: [:file]

  controller do
    def create
      @editor_image = EditorImage.new
      @editor_image.editor_image = params[:attachment][:file]
      @editor_image.save!
      render json: @editor_image
    rescue ActiveRecord::RecordInvalid
      render json: @editor_image.errors, status: 422
    end
  end
end
