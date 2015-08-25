class CreateHelpers < ActiveRecord::Migration
  def change
    create_table :helpers do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
