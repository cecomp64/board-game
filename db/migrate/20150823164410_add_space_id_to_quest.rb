class AddSpaceIdToQuest < ActiveRecord::Migration
  def change
    add_column :quests, :space_id, :integer
  end
end
