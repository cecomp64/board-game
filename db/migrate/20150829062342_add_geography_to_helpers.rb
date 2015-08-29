class AddGeographyToHelpers < ActiveRecord::Migration
  def change
    add_column :helpers, :geography_id, :integer, default: nil

    # Move existing modifiers to the helper
    # Default to bay area
    bay = Geography.where(name: "Bay Area").first
    Helper.all.each do |h|
      h.geography_id = bay
      h.modifier_instances.each do |mi|
        if(mi.geography)
          h.geography_id = mi.geography_id
          # Remove this mi, and replace with a non-geo MI
          mi_n = ModifierInstance.find_or_create_by(modifier: mi.modifier, geography: nil)
          h.modifier_instances.delete mi
          h.modifier_instances << mi_n
        end
      end
      h.save
    end
  end
end
