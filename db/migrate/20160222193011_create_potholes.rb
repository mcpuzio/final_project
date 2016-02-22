class CreatePotholes < ActiveRecord::Migration
  def change
    create_table :potholes do |t|
      t.string :street
      t.date :date_reported
      t.boolean :size
      t.text :description
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps null: false
    end
  end
end
