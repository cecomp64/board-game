class AddColumnsToModifier < ActiveRecord::Migration
  def change
    add_column :modifiers, :draw_other, :integer, default: 0
    add_column :modifiers, :draw_other_all, :integer, default: 0
  end
end
