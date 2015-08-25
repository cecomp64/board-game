class AddRollToQuests < ActiveRecord::Migration
  def change
    add_column :quests, :roll, :integer, default: 4
  end
end
