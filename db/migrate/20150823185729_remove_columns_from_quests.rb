class RemoveColumnsFromQuests < ActiveRecord::Migration
  def change
    remove_column :quests, :draw, :string
    remove_column :quests, :roll, :string
    add_column :quests, :modifier_id, :string, default: nil
  end
end
