class CreateModifierInstances < ActiveRecord::Migration
  def change
    create_table :modifier_instances do |t|
      t.integer :geography_id
      t.integer :space_id
      t.integer :modifier_id
      t.string :character_id
      t.string :character

      t.timestamps null: false
    end
  end
end
