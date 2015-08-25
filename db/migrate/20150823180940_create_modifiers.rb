class CreateModifiers < ActiveRecord::Migration
  def change
    create_table :modifiers do |t|
      t.integer :space_id
      t.integer :geography_id
      t.string :name
      t.integer :roll
      t.integer :draw
      t.integer :move
      t.integer :turn
      t.integer :banked_turns

      t.timestamps null: false
    end
  end
end
