class CreateJoinTableHelpersTags < ActiveRecord::Migration
  def change
    create_join_table :helpers, :tags do |t|
      # t.index [:helper_id, :tag_id]
      # t.index [:tag_id, :helper_id]
    end
  end
end
