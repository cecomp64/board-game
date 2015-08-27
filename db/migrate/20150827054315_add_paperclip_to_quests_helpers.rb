class AddPaperclipToQuestsHelpers < ActiveRecord::Migration
  def change
    add_attachment :quests, :image 
    add_attachment :helpers, :image 
  end
end
