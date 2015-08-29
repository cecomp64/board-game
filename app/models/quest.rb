class Quest < ActiveRecord::Base
  has_and_belongs_to_many :modifier_instances
  belongs_to :geography
  has_attached_file :image, styles: { small: "64x64", med: "380x200", large: "200x200" }, default_url: "missing.jpeg"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def easy?
    return (roll < 3)
  end

  def medium?
    return (roll >= 3 && roll < 5)
  end

  def hard?
    return (roll >= 5)
  end
end
