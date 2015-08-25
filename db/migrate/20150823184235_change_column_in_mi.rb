class ChangeColumnInMi < ActiveRecord::Migration
  def change
    change_column :modifier_instances, :character_id, :integer, default:0
    remove_column :modifier_instances, :character
  end
end
