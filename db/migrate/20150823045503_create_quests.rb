class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :title
      t.text :text
      t.integer :draw
      t.string :roll

      t.timestamps null: false
    end
  end
end
