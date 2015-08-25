class ChangeColumnInModifier < ActiveRecord::Migration
  def change
      change_column :modifiers, :roll, :integer, default: 0
      change_column :modifiers, :draw, :integer, default: 0
      change_column :modifiers, :move, :integer, default: 0
      change_column :modifiers, :turn, :integer, default: 0
      change_column :modifiers, :banked_turns, :integer, default: 0
  end
end
