class JoinModifierInstancesWithPlayer < ActiveRecord::Migration
  def change
    create_join_table :modifier_instances, :players do |t|
      #t.index [:player_id, :modifier_instance_id]
    end
  end
end
