class ChangeQuestRollToInteger < ActiveRecord::Migration
  def change
    change_column :quests, :roll, :integer
  end
end
