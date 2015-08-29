class ModifierInstance < ActiveRecord::Base
  belongs_to :modifier
  belongs_to :geography
  belongs_to :space
  has_and_belongs_to_many :helpers
  has_and_belongs_to_many :quests
  has_and_belongs_to_many :tags

  def to_words
    if modifier
      description = modifier.to_words
      description = (geography && space.nil?) ? "In #{geography.name}: #{description}" : description
      description = space ? "In #{space.name}: #{description}" : description
    end

    return description
  end

  def good?
    return modifier.good?
  end
  def bad?
    return modifier.bad?
  end
  def nuetral?
    return modifier.nuetral?
  end
  def balance
    return modifier.balance
  end
end
