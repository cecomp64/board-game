class RemoveGeographyIdFromModifier < ActiveRecord::Migration
  def change
    remove_column :modifiers, :geography_id, :string
    remove_column :modifiers, :space_id, :string
  end
end
