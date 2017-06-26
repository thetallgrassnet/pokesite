class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :featured_image
      t.integer :event_type
      t.date :start_date
      t.date :end_date
      t.string :location
      t.text :notes

      t.timestamps
    end
  end
end
