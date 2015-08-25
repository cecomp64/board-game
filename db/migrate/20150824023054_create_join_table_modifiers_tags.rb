class CreateJoinTableModifiersTags < ActiveRecord::Migration
  def change
    create_join_table :modifiers, :tags do |t|
      # t.index [:modifier_id, :tag_id]
      # t.index [:tag_id, :modifier_id]
    end
  end
end
