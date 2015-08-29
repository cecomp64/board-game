class AddGeographyIdToQuests < ActiveRecord::Migration
  def change
    add_column :quests, :geography_id, :integer
    remove_column :quests, :space_id
  end
end
