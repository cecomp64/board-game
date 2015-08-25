class AddColumnToModifierInstances < ActiveRecord::Migration
  def change
    add_column :modifier_instances, :name, :string
  end
end
