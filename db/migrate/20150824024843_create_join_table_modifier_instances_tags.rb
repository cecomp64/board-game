class CreateJoinTableModifierInstancesTags < ActiveRecord::Migration
  def change
    create_join_table :modifier_instances, :tags do |t|
      # t.index [:modifier_instance_id, :tag_id]
      # t.index [:tag_id, :modifier_instance_id]
    end
  end
end
