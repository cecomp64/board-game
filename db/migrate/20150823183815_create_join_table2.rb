class CreateJoinTable2 < ActiveRecord::Migration
  def change
    create_join_table :modifier_instances, :quests do |t|
      # t.index [:modifier_instance_id, :quest_id]
      # t.index [:quest_id, :modifier_instance_id]
    end
  end
end
