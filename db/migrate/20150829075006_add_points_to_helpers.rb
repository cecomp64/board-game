class AddPointsToHelpers < ActiveRecord::Migration
  def change
    add_column :helpers, :points, :integer, default: 3
    add_column :quests, :points, :integer, default: 10
  end
end
