module ModifierInstancesHelper
  def add_modifier_worker(params, helper_or_quest)
    mid = params[:modifier]
    gid = params[:geography]
    sid = params[:space]
    remove = params[:remove]
    m = Modifier.where(id: mid).first
    g = Geography.where(id: gid).first
    s = Space.where(id: sid).first

    if helper_or_quest.nil?
      flash[:error] = "Helper or Quest was not found."
      redirect_to(quests_path)
    end

    if remove
      mi = ModifierInstance.where(id: params[:modifier_instance]).first
      helper_or_quest.modifier_instances.delete(mi)
    end

    if m.nil?
      flash[:error] = "Could not find modifier with ID #{mid}"
    else
      mi = ModifierInstance.find_or_create_by(modifier: m, geography: g, space: s)
      helper_or_quest.modifier_instances << mi
    end
  end

end
