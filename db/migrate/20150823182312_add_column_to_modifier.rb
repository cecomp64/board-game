class AddColumnToModifier < ActiveRecord::Migration
  def change
    add_column :modifiers, :move_other, :integer, default: 0
  end
end
