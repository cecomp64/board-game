class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :helpers, :modifier_instances do |t|
      # t.index [:helper_id, :modifier_instance_id]
      # t.index [:modifier_instance_id, :helper_id]
    end
  end
end
