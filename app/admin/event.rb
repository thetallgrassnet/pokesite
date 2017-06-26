ActiveAdmin.register Event do
  permit_params :name, :event_type, :start_date, :end_date, :featured_image, :notes

  index do
    selectable_column
    id_column
    column :name
    column :event_type
    column :start_date
    column :end_date
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :event_type
      row :start_date
      row :end_date
      row :featured_image do |e|
        img src: e.featured_image.thumb.url
      end
      row :notes
    end
    active_admin_comments
  end

  form html: { multipart: true } do |f|
    f.inputs 'Event Details' do
      f.input :name
      f.input :event_type
      f.input :start_date
      f.input :end_date
      f.input :featured_image
      f.input :notes
    end
    f.actions
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
end
