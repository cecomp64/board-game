class Helper < ActiveRecord::Base
  has_and_belongs_to_many :modifier_instances
  has_and_belongs_to_many :tags
  belongs_to :geography
  belongs_to :space
  has_attached_file :image, styles: { small: "64x64", med: "380x200", large: "200x200" }, default_url: "missing.jpeg"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def balance
    b = 0
    modifier_instances.each do |mi|
      b += mi.balance
    end

    return b
  end

  def good?
    return (balance > 0)
  end
  def bad?
    return (balance < 0)
  end
  def nuetral?
    return (balance == 0)
  end

  def in_geo?(geo)
    modifier_instances.each do |mi|
      return true if(mi.geography == geo)
    end

    return false
  end
end 
