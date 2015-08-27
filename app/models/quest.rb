class Quest < ActiveRecord::Base
  has_and_belongs_to_many :modifier_instances
  has_attached_file :image, styles: { small: "64x64", med: "380x200", large: "200x200" }, default_url: "missing.jpeg"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
